from PIL import Image
import os

def convert_image_to_mif(image_path, mif_path):
    # Abrir la imagen
    img = Image.open(image_path)

    # Obtener dimensiones de la imagen
    width, height = img.size

    print(f"Dimensiones de la imagen: {width}x{height}")

    # Verificar que la imagen sea de 100x100
    if width != 100 or height != 100:
        print("La imagen debe ser de 100x100 píxeles.")
        return

    # Crear o abrir el archivo .mif para escritura
    with open(mif_path, 'w') as mif_file:
        # Escribir encabezado del archivo .mif
        mif_file.write("DEPTH = 60000;\n")
        mif_file.write("WIDTH = 32;\n")
        mif_file.write("ADDRESS_RADIX = HEX;\n")
        mif_file.write("DATA_RADIX = HEX;\n")
        mif_file.write("\nCONTENT BEGIN\n")

        # Inicializar variables para manejar rangos con píxeles en 0
        zero_range_start = None
        zero_range_end = None

        # Iterar sobre cada píxel de la imagen
        for y in range(height):
            for x in range(width):
                # Obtener valor de escala de grises del píxel
                pixel = img.getpixel((x, y))

                # Convertir a un solo valor de escala de grises
                gray_value = pixel if isinstance(pixel, int) else sum(pixel) // len(pixel)

                # Verificar si el píxel es 0
                if gray_value == 0:
                    if zero_range_start is None:
                        zero_range_start = y * width + x
                    zero_range_end = y * width + x
                else:
                    # Si se encontró un rango de píxeles en 0, escribirlo en el formato adecuado
                    if zero_range_start is not None:
                        if zero_range_start == zero_range_end:
                            # Si el rango es solo un píxel, escribir sin corchetes y dos puntos
                            mif_file.write(f"\t{zero_range_start} : 0;\n")
                        else:
                            mif_file.write(f"\t[{zero_range_start}..{zero_range_end}] : 0;\n")
                        zero_range_start = None
                        zero_range_end = None

                    # Escribir píxel normal en formato hexadecimal
                    mif_file.write(f"\t{y * width + x} : {gray_value:02X};\n")

        # Si hay un rango de píxeles en 0 al final de la imagen, escribirlo
        if zero_range_start is not None:
            if zero_range_start == zero_range_end:
                # Si el rango es solo un píxel, escribir sin corchetes y dos puntos
                mif_file.write(f"\t{zero_range_start} : 0;\n")
            else:
                mif_file.write(f"\t[{zero_range_start}..{zero_range_end}] : 0;\n")

        # Escribir el final del archivo .mif
        mif_file.write("END;\n")

    print(f"La imagen ha sido convertida a {mif_path}.")

# Obtener la lista de archivos en el directorio actual
files = os.listdir()

# Filtrar la lista para obtener solo archivos de imagen
image_files = [file for file in files if file.lower().endswith(('.png', '.jpg', '.jpeg', '.gif', '.bmp'))]

if not image_files:
    print("No se encontraron archivos de imagen en el directorio.")
else:
    # Seleccionar la primera imagen encontrada
    input_image_path = image_files[0]

    # Crear el nombre del archivo .mif de salida
    output_mif_path = "memory.mif"

    # Llamar a la función de conversión
    convert_image_to_mif(input_image_path, output_mif_path)