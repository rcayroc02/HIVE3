import random

# Datos de ejemplo
usuarios = ['Amy', 'Fred', 'Jane', 'Bob']
urls = ['www.cnn.com', 'www.crap.com', 'www.myblog.com', 'www.flickr.com', 'cnn.com/index.htm']
horas = [f"{h}:{m:02d}" for h in range(8, 18) for m in range(0, 60, 5)]  # Tiempos entre 8:00 y 17:55 cada 5 min

# Número de entradas
num_logs = 1000

# Archivo de salida
archivo_log = 'visits.log'

with open(archivo_log, 'w', encoding='utf-8') as f:
    for _ in range(num_logs):
        name = random.choice(usuarios)
        url = random.choice(urls)
        time = random.choice(horas)
        f.write(f"{name}\t{url}\t{time}\n")

print(f"Archivo {archivo_log} generado con {num_logs} entradas.")
