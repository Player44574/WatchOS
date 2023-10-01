import vlc
import tkinter as tk
from tkinter import ttk
from tkinter import filedialog

class AudioPlayer:
    def __init__(self, root):
        self.root = root
        self.root.title("Reproductor de Audio")
        
        self.instance = vlc.Instance()
        self.player = self.instance.media_player_new()
        self.media = None
        self.volume = 50
        self.loop = False

        self.create_widgets()
        
    def create_widgets(self):
        # Botón Play/Pause
        self.play_button = ttk.Button(self.root, text="Play", command=self.toggle_play)
        self.play_button.grid(row=0, column=0, padx=10, pady=10)

        # Botón Stop
        self.stop_button = ttk.Button(self.root, text="Stop", command=self.stop_audio)
        self.stop_button.grid(row=0, column=1, padx=10, pady=10)

        # Barra de progreso
        self.progress_bar = ttk.Scale(self.root, from_=0, to=100, orient="horizontal", length=300, command=self.set_progress)
        self.progress_bar.set(0)
        self.progress_bar.grid(row=0, column=2, padx=10, pady=10)

        # Volumen
        self.volume_label = ttk.Label(self.root, text="Volumen:")
        self.volume_label.grid(row=1, column=0, padx=10, pady=10)
        self.volume_scale = ttk.Scale(self.root, from_=0, to=100, orient="horizontal", length=100, command=self.set_volume, variable=tk.IntVar(value=self.volume))
        self.volume_scale.set(self.volume)
        self.volume_scale.grid(row=1, column=1, padx=10, pady=10)

        # Botón de bucle
        self.loop_button = ttk.Checkbutton(self.root, text="Bucle", command=self.toggle_loop)
        self.loop_button.grid(row=1, column=2, padx=10, pady=10)

        # Abrir archivo
        self.open_button = ttk.Button(self.root, text="Abrir archivo", command=self.open_file)
        self.open_button.grid(row=2, column=0, columnspan=3, padx=10, pady=10)

    def open_file(self):
        file_path = filedialog.askopenfilename(filetypes=[("Archivos de audio", "*.mp3 *.m4a *.ogg *.wav *.aac")])
        if file_path:
            self.media = self.instance.media_new(file_path)
            self.player.set_media(self.media)
            self.toggle_play()

    def toggle_play(self):
        if self.media:
            if self.player.get_state() == vlc.State.Playing:
                self.player.pause()
                self.play_button.config(text="Play")
            else:
                self.player.play()
                self.play_button.config(text="Pause")
                self.update_progress()

    def stop_audio(self):
        if self.media:
            self.player.stop()
            self.play_button.config(text="Play")
            self.progress_bar.set(0)

    def set_progress(self, value):
        if self.media:
            try:
                position = int(float(value))
                self.player.set_position(position / 100.0)
            except ValueError:
                pass

    def set_volume(self, value):
        self.volume = int(value)
        self.player.audio_set_volume(self.volume)

    def toggle_loop(self):
        if self.media:
            self.loop = not self.loop
            self.media.add_option(f"--no-repeat={'yes' if self.loop else 'no'}")

    def update_progress(self):
        if self.media and self.player.get_state() == vlc.State.Playing:
            time_position = self.player.get_time()
            duration = self.player.get_length()
            if time_position >= 0 and duration > 0:
                position = (time_position / duration) * 100
                self.progress_bar.set(int(position))
                self.root.after(100, self.update_progress)

if __name__ == "__main__":
    root = tk.Tk()
    player = AudioPlayer(root)
    root.mainloop()