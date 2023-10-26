
size(500, 500);

//Carrega uma imagem do diretório de dados
PImage img = loadImage("Toyokawa.jpg");
image(img, 50, 50);
int[] hist = new int[256];
float quantideal;
int g = 256;
float q = 0;
int  aux = 0;
float somafreq = 0;

PrintWriter output;
output = createWriter("equalizacao.txt"); 
// calcula o histograma
for (int i = 0; i < img.width; i++) {
  for (int j = 0; j < img.height; j++) {
    int bright = int(brightness(get(i, j)));
    hist[bright]++; 

  }
}
output.println( "\nFREQUENCIA DE CADA TOM DE PIXEL\n");
for (int i = 0; i < 256; i++) {  
     output.println(i + "\t" + hist[i]);
}

quantideal= (img.width *img.width)/g;


output.println( "\nFREQUENCIA ACUMULADA\n"); 
for (int i = 0; i < 255; i++) {  
     somafreq += hist[i];
    output.println(i + "\t = " + somafreq);
    q = ((somafreq/quantideal) - 1);
    aux = int (q);
    output.println("NOVO NIVEL DE CINZA PROCURADO " + q );
 
}

output.println("\nQUANTIDADE IDEAL 'I'= " + quantideal);
//output.println(quantideal);

output.flush(); 
output.close(); 
exit(); 
