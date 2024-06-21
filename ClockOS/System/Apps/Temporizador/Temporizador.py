import tkinter as tk
from tkinter import messagebox

def start_pause_timer():
    global is_running
    if not is_running:
        try:
            minutes = int(entry.get())
            global seconds
            seconds = minutes * 60
            is_running = True
            start_button.config(text="Pausa", command=pause_timer)
            reset_button.config(state="disabled")
            countdown()
        except ValueError:
            messagebox.showerror("Error", "Ingresa un número válido de minutos.")
    else:
        is_running = False
        start_button.config(text="Reanudar", command=resume_timer)
        reset_button.config(state="normal")

def pause_timer():
    global is_running
    is_running = False
    start_button.config(text="Reanudar", command=resume_timer)
    reset_button.config(state="normal")

def resume_timer():
    global is_running
    is_running = True
    start_button.config(text="Pausa", command=pause_timer)
    reset_button.config(state="disabled")
    countdown()

def reset_timer():
    global is_running
    is_running = False
    start_button.config(text="Iniciar Temporizador", command=start_pause_timer)
    reset_button.config(state="disabled")
    timer.set("00:00")

def countdown():
    global seconds
    if is_running and seconds > 0:
        mins, secs = divmod(seconds, 60)
        timer.set(f'{mins:02d}:{secs:02d}')
        root.after(1000, countdown)  # Llama a countdown() cada 1000 ms (1 segundo)
        seconds -= 1
    elif is_running and seconds == 0:
        timer.set("00:00")
        messagebox.showinfo("Temporizador", "¡Tiempo completado!")
        start_button.config(text="Iniciar Temporizador", command=start_pause_timer)
        reset_button.config(state="normal")

root = tk.Tk()
root.title("Temporizador")

frame = tk.Frame(root)
frame.pack(padx=10, pady=10)

label = tk.Label(frame, text="Ingresa minutos:")
label.pack()

entry = tk.Entry(frame)
entry.pack()

is_running = False
seconds = 0

start_button = tk.Button(frame, text="Iniciar Temporizador", command=start_pause_timer)
start_button.pack()

reset_button = tk.Button(frame, text="Reiniciar", state="disabled", command=reset_timer)
reset_button.pack()

timer = tk.StringVar()
timer.set("00:00")
timer_label = tk.Label(frame, textvariable=timer, font=("Helvetica", 48))
timer_label.pack()

root.mainloop()