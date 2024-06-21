import tkinter as tk
import time

def start_stop_timer():
    global is_running, start_time, elapsed_time
    if not is_running:
        if elapsed_time == 0:
            start_time = time.time()
        else:
            start_time = time.time() - elapsed_time
        is_running = True
        start_button.config(text="Detener", command=stop_timer)
        reset_button.config(state="disabled")
        update_timer()
    else:
        stop_timer()

def stop_timer():
    global is_running, start_time, elapsed_time
    if is_running:
        elapsed_time = time.time() - start_time
    is_running = False
    start_button.config(text="Iniciar", command=start_stop_timer)
    reset_button.config(state="normal")

def reset_timer():
    global is_running, elapsed_time
    is_running = False
    start_time = 0
    elapsed_time = 0
    start_button.config(text="Iniciar", command=start_stop_timer)
    reset_button.config(state="disabled")
    timer.set("00:00")

def update_timer():
    if is_running:
        current_time = time.time() - start_time
    else:
        current_time = elapsed_time

    mins, secs = divmod(int(current_time), 60)
    timer.set(f'{mins:02d}:{secs:02d}')
    root.after(1000, update_timer)

root = tk.Tk()
root.title("Cronómetro")

frame = tk.Frame(root)
frame.pack(padx=10, pady=10)

is_running = False
start_time = 0
elapsed_time = 0

start_button = tk.Button(frame, text="Iniciar", command=start_stop_timer)
start_button.pack()

reset_button = tk.Button(frame, text="Reiniciar", state="disabled", command=reset_timer)
reset_button.pack()

timer = tk.StringVar()
timer.set("00:00")
timer_label = tk.Label(frame, textvariable=timer, font=("Helvetica", 48))
timer_label.pack()

root.mainloop()