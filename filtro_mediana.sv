module filtro_mediana(
    input logic [7:0] pixels [0:99][0:99],
    output logic [7:0] output_pixels [0:99][0:99]
);
    integer i, j, k, l;
    logic [7:0] window [0:2][0:2];
    logic [7:0] temp;

    always_comb begin
        for (i = 0; i < 100; i = i + 1) begin
            for (j = 0; j < 100; j = j + 1) begin
                // Rellenar la ventana con los píxeles cercanos
                for (k = 0; k < 3; k = k + 1) begin
                    for (l = 0; l < 3; l = l + 1) begin
                        window[k][l] = pixels[i + k - 1][j + l - 1];
                    end
                end

                // Ordenar la ventana usando un simple algoritmo de ordenación de burbuja
                for (k = 0; k < 3; k = k + 1) begin
                    for (l = 0; l < 3 - 1; l = l + 1) begin
                        if (window[k][l] > window[k][l + 1]) begin
                            temp = window[k][l];
                            window[k][l] = window[k][l + 1];
                            window[k][l + 1] = temp;
                        end
                    end
                end

                // Obtener el valor de la mediana (el quinto valor en la ventana ordenada)
                output_pixels[i][j] = window[1][1]; // Mediana en una ventana ordenada es el valor del medio
            end
        end
    end
endmodule