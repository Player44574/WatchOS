import sys
import os
import subprocess
import tkinter as tk
from tkinter import ttk
from PIL import Image, ImageTk

class AppLauncher:
    def __init__(self, root):
        self.root = root
        root.title("App Launcher")
        root.geometry("400x320")

        self.icon_size = 64
        self.spacing = 16
        self.current_page = 1
        self.apps_per_page = 6
        self.pages = []

        app_dir = os.path.join(os.path.dirname(__file__), "System/Apps")
        app_folders = [folder for folder in os.listdir(app_dir) if os.path.isdir(os.path.join(app_dir, folder))]
        app_folders.sort()  # Ordenar las carpetas de aplicaciones

        for i in range(0, len(app_folders), self.apps_per_page):
            self.pages.append(app_folders[i:i + self.apps_per_page])

        self.page_count = len(self.pages)

        self.create_app_buttons()

        # Agregar botones de navegación en una fila usando grid
        navigation_frame = ttk.Frame(root)
        navigation_frame.grid(row=2, column=0, columnspan=3, padx=10, pady=10)
        prev_button = ttk.Button(navigation_frame, text="Anterior", command=self.prev_page)
        prev_button.grid(row=0, column=0, padx=10)
        next_button = ttk.Button(navigation_frame, text="Siguiente", command=self.next_page)
        next_button.grid(row=0, column=1, padx=10)

    def create_app_buttons(self):
        if self.current_page <= self.page_count:
            app_buttons = self.pages[self.current_page - 1]
            row, col = 0, 0

            for folder in app_buttons:
                app_folder = os.path.join(os.path.dirname(__file__), "System/Apps", folder)
                icon_path = os.path.join(app_folder, "appIcon.png")
                script_path = os.path.join(app_folder, f"{folder}.py")

                if os.path.exists(icon_path) and os.path.exists(script_path):
                    image = Image.open(icon_path)
                    image = image.resize((self.icon_size, self.icon_size), 1)
                    photo = ImageTk.PhotoImage(image)

                    button = ttk.Button(self.root, text=folder, image=photo, compound=tk.TOP,
                                        command=lambda path=script_path: self.open_app(path))
                    button.image = photo
                    button.grid(row=row, column=col, padx=10, pady=10)
                    col += 1
                    if col >= 3:
                        col = 0
                        row += 1

    def open_app(self, app_path):
        try:
            subprocess.Popen(['python3', app_path])
        except Exception as e:
            print(f"Error al abrir la aplicación")

    def prev_page(self):
        if self.current_page > 1:
            self.current_page -= 1
            self.clear_page()
            self.create_app_buttons()

    def next_page(self):
        if self.current_page < self.page_count:
            self.current_page += 1
            self.clear_page()
            self.create_app_buttons()

    def clear_page(self):
        for widget in self.root.winfo_children():
            widget.grid_forget()

if __name__ == '__main__':
    root = tk.Tk()
    app = AppLauncher(root)
    root.mainloop()