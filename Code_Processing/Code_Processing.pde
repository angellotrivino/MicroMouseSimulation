////VARIABLES GLOBALES
int nCua; //Numero de cuadrados
int llegX; /// valor X matriz del objetivo del micromouse
int llegY; /// valor Y matriz del objetivo del micromouse
int llegCoorX; ///Coordenadas X en el dibujo del objetivo
int llegCoorY; ///Coordenadas Y en el dibujo del objetivo 
int parX[]; ///vector paredes coodernada X
int parY[]; ///vector paredes coodernada Y
int parXEst[][]; // vector Estado paredes bloqueo = 0, no bloqueo = 1 en X y Y
int parYEst[][]; // vector Estado paredes bloqueo = 0, no bloqueo = 1 en X y Y
int tamCua; //Longitud de cada cuadrado
int tamMouse; /// tamaÃ±o del raton
int mouseCoorX; ///Coordenadas X en el dibujo del mouse
int mouseCoorY; ///Coordenadas Y en el dibujo del mouse 
int margenLabX; /// margen del laberinto coordenada X -- Inicio
int margenLabY; /// margen del laberinto coordenada Y -- Inicio
int margenLabX1; /// margen del laberinto coordenada X1 -- Final
int margenLabY1; /// margen del laberinto coordenada Y1 -- Final
PImage foto; /// imagen del raton
int matFilFlo[][];
String estAlg; //// Estado del algoritmo: "inicio", "aprendizaje" (recalcular los datos),
///  "rutaCorta" (Camino mÃ¡s corto para cumplir objetivo)
int velX; ///Velocidad del raton en el eje X.
int velY; /// Velocidad del raton en el eje Y.
int iGlobal; //// valor global de i Ã³ Y para movimiento del raton por el laberinto, y
///  el recalculo del algoritmo
int jGlobal; //// valor global de j Ã³ X para movimiento del raton por el laberinto, y
///  el recalculo del algoritmo
String estDirec;  /// Direccion que se dirige el raton, derecha = "rigth", izquierda = "left"
/// arriba = "up", abajo = "down"
int estCumCuad[][]; //estado si ya sea pasado por el Cuadro
int giroMicroMouse; //// avanza un cuadro dependiendo de la posicion de giro. Ej: derecha 
//hacia abajo, para evitar confuciones en el algoritmo
////

void setup() {
  ///La inicializacion de las variables estan multiplicados por 3, 
  ///respecto al tamaÃ±o, real.

  ///Inicializar variables
  nCua = 8; 
  parX = new int[nCua+1];//// + 1 por una linea de mas del total del cuadrado.
  parY = new int[nCua+1];//// + 1 por una linea de mas del total del cuadrado.
  parXEst = new int[nCua+1][nCua+1];
  parYEst = new int[nCua+1][nCua+1];
  matFilFlo = new int[nCua][nCua];
  margenLabX = 30;
  margenLabY = margenLabX;
  mouseCoorX = margenLabX+10;
  mouseCoorY = margenLabY+10;
  margenLabX1 = 552 + margenLabX;
  margenLabY1 = margenLabX1;
  tamCua = 69;
  tamMouse = 45;
  parX[0] = margenLabX;
  parY[0] = margenLabY;
  llegX = 4; ///punto de llegada
  llegY = 4;
  llegCoorX = margenLabX + (llegX*tamCua);
  llegCoorY = margenLabY + (llegY*tamCua);
  foto = loadImage("mouse_right.png"); ///cargar imagen de inicio en direccion del raton o micro-mouse
  estAlg = "inicio";
  velX = 5; ///velocidad inicial en animacion
  velY = 5;
  estDirec = "right";
  estCumCuad = new int[nCua][nCua];
  ///

  ////Inicializar estado de paredes
  //Horizontal vacios
  parXEst[1][3] = 1;
  parXEst[1][6] = 1;
  parXEst[1][7] = 1;
  parXEst[2][0] = 1;
  parXEst[2][1] = 1;
  parXEst[2][2] = 1;
  parXEst[2][3] = 1;
  parXEst[2][7] = 1;
  parXEst[3][0] = 1;
  parXEst[3][1] = 1;
  parXEst[3][2] = 1;
  parXEst[3][6] = 1;
  parXEst[4][0] = 1;
  parXEst[4][1] = 1;
  parXEst[4][3] = 1;
  parXEst[4][4] = 1;
  parXEst[4][5] = 1;
  parXEst[4][7] = 1;
  parXEst[5][0] = 1;
  parXEst[5][1] = 1;
  parXEst[5][2] = 1;
  parXEst[5][5] = 1;
  parXEst[5][6] = 1;
  parXEst[6][0] = 1;
  parXEst[6][1] = 1;
  parXEst[6][3] = 1;
  parXEst[6][7] = 1;
  parXEst[7][0] = 1;
  parXEst[7][2] = 1;
  parXEst[7][3] = 1;
  parXEst[7][4] = 1;
  parXEst[7][6] = 1;
  parXEst[7][7] = 1;
  //

  //vertical vacios
  parYEst[0][1] = 1;
  parYEst[0][2] = 1;
  parYEst[0][3] = 1;
  parYEst[0][4] = 1;
  parYEst[0][5] = 1;
  parYEst[0][7] = 1;
  parYEst[1][2] = 1;
  parYEst[1][4] = 1;
  parYEst[1][5] = 1;
  parYEst[1][6] = 1;
  parYEst[2][4] = 1;
  parYEst[2][5] = 1;
  parYEst[2][7] = 1;
  parYEst[3][3] = 1;
  parYEst[3][5] = 1;
  parYEst[3][7] = 1;
  parYEst[4][4] = 1;
  parYEst[4][7] = 1;
  parYEst[5][3] = 1;
  parYEst[5][4] = 1;
  parYEst[5][5] = 1;
  parYEst[5][7] = 1;
  parYEst[6][2] = 1;
  parYEst[6][5] = 1;
  parYEst[6][6] = 1;
  parYEst[7][1] = 1;
  parYEst[7][2] = 1;
  parYEst[7][4] = 1;
  parYEst[7][6] = 1;
  parYEst[7][7] = 1;
  //

  ///inicializar valores de los vertices de las paredes

  for (int j = 0; j < nCua; j++) {
    parX[j+1] = parX[j] + tamCua; /// Hallar valor horizontal de la pared X1 desde X
    parY[j+1] = parY[j] + tamCua; /// Hallar valor vertical de la pared Y1 desde Y
  }

  ////

  ////

  size(600, 600); //tamaÃ±o de la ventana 
  surface.setResizable(true);
}

void draw() {
  background(255);

  //cuadrado total del laberinto
  fill(255);
  strokeWeight(2);
  stroke(255, 0, 0);
  quad(margenLabX, margenLabY, 
    margenLabX1, margenLabY, 
    margenLabX1, margenLabY1, 
    margenLabX, margenLabY1);
  //

  ///Lugar de llegada
  fill(0, 0, 255);
  stroke(0, 0, 255);
  quad(llegCoorX, llegCoorY, 
    llegCoorX+tamCua, llegCoorY, 
    llegCoorX+tamCua, llegCoorY+tamCua, 
    llegCoorX, llegCoorY+tamCua);
  ///
  //Dibujar laberinto
  dibujarLab();
  //

  ////Lugar de inicio del raton
  fill(0, 193, 193);
  stroke(0, 193, 193);
  quad(mouseCoorX, mouseCoorY, 
    mouseCoorX+tamMouse, mouseCoorY, 
    mouseCoorX+tamMouse, mouseCoorY+tamMouse, 
    mouseCoorX, mouseCoorY+tamMouse);
  image(foto, mouseCoorX, mouseCoorY, tamMouse, tamMouse);
  ImagenMouse(estDirec);
  ////

 

  ////llamada del algoritmo FillFlood
  Algoritmo_FillFlood();
  ///
  ///movimiento del raton
  switch(estDirec) {
  case "right":
    ////movimiento a la derecha
    mouseCoorX += velX;
    break;
  case "left":
    ////movimiento a la izquierda
    mouseCoorX -= velX;
    break;
  case "down":
    ////movimiento abajo
    mouseCoorY += velY;
    break;
  case "up":
    ////movimiento arriba
    mouseCoorY -= velY;
    break;
  }
  ////
}

void dibujarLab() {
  fill(0);
  strokeWeight(3);
  stroke(0);

  ///Paredes del laberinto y valores del algoritmo

  for (int i = 0; i <= nCua; i++) {
    for (int j = 0; j < nCua; j++) {

      if (parXEst[i][j] == 0) {
        line(parX[j], parY[i], parX[j+1], parY[i]);
      }

      if (parYEst[j][i] == 0) {
        line(parY[i], parX[j], parY[i], parX[j+1]);
      }

      if (i < nCua) {
        textSize(32);
        fill(0, 0, 0);
        text(matFilFlo[i][j], 
          parX[j] + (tamMouse / 3), parY[i] + (tamCua / 2+10));
        fill(0, 0, 255);
        //text(estCumCuad[i][j], 
          
          //parX[j] + (tamMouse +5), parY[i] + (tamCua / 2+10));
      }
    }
  }
}

void Algoritmo_FillFlood() 
{

  if (estAlg == "inicio") 
  {
    //                                          1
    ////Inicializar valores segun algoritmo  1  0  1  etc...
    //                                          1

    for (int i = 0; i < nCua; i++) 
    {
      for (int j = 0; j < nCua; j++) 
      {
        matFilFlo[i][j] = Math.abs(llegY-i) + Math.abs(llegX-j);
      }
    }
    estAlg = "aprendizaje";
  } else if (estAlg == "aprendizaje") 
  {
    println(iGlobal+" "+jGlobal+ "  "+ estDirec);
    ////Sensor pared derecha parYEst[iGlobal][jGlobal+1]
    ////Sensor pared izquierda parYEst[iGlobal][jGlobal]
    ////Sensor pared arriba parXEst[iGlobal][jGlobal]
    ////Sensor pared abajo parXEst[iGlobal+1][jGlobal]

    if (jGlobal == llegX && iGlobal == llegY) {
      estDirec = "stop";
      estAlg = "rutaCorta";
      mouseCoorX = margenLabX+10;
      mouseCoorY = margenLabY+10;
      jGlobal = 0;
      iGlobal = 0;
      estDirec = "right";
      delay(5000);
    } else {
      if (estDirec=="right")  ///estado de direccion del raton
      {
        if (giroMicroMouse == 0) {
          if (mouseCoorX>=parX[jGlobal+1]) 
          {
            estCumCuad[iGlobal][jGlobal]++;
            jGlobal++;

            giroMicroMouse=1;
          }
        } else 
        {
          //    0
          //    R  1
          //    0
          if (parXEst[iGlobal][jGlobal]==0 && //Arriba   ///SensorI
            parXEst[iGlobal+1][jGlobal]==0 && //Abajo    ///SensorD
            parYEst[iGlobal][jGlobal+1]==1) ///Derecha  //SensorF
          {

            if (mouseCoorX>=parX[jGlobal+1]) 
            {
              if (matFilFlo[iGlobal][jGlobal] < matFilFlo[iGlobal][jGlobal+1])
              {
                Actualizar_matFilFlo();
              }
              estCumCuad[iGlobal][jGlobal]++; //// si ya se recorrio el cuadro anterior
              jGlobal++;
            }
          } else
            //    0
            //    R  1
            //    1
            if (parXEst[iGlobal][jGlobal]==0 && //Arriba ///SensorI
              parXEst[iGlobal+1][jGlobal]==1 && //Abajo  ///SensorD
              parYEst[iGlobal][jGlobal+1]==1) //Derecha  ///SensorF
            {
              //// Derecha                  ////Abajo
              if (matFilFlo[iGlobal][jGlobal+1]>matFilFlo[iGlobal+1][jGlobal]) 
              {
                estDirec = "down";
                giroMicroMouse = 0;
                Giro90_MicroMouse(); ////giro 90 grados raton
                if (matFilFlo[iGlobal][jGlobal] < matFilFlo[iGlobal][jGlobal+1])
                {
                  Actualizar_matFilFlo();
                }
                //println(iGlobal+" "+jGlobal);
              } 
              //// Derecha                  ////Abajo
              if (matFilFlo[iGlobal][jGlobal+1]<=matFilFlo[iGlobal+1][jGlobal]) 
              {
                if (mouseCoorX>=parX[jGlobal+1]) 
                {
                  ///MIRAR SI HAY PROBLEMAS///
                  if (matFilFlo[iGlobal][jGlobal] < matFilFlo[iGlobal][jGlobal+1])
                  {
                    Actualizar_matFilFlo();
                  }
                  estCumCuad[iGlobal][jGlobal]++; //// sÃ­ ya se recorrio el cuadro anterior
                  jGlobal++;
                }
              }
            } else
              //    0
              //    R  0
              //    0
              if (parXEst[iGlobal][jGlobal]==0 && //Arriba  //SI
                parXEst[iGlobal+1][jGlobal]==0 && //Abajo   //SD
                parYEst[iGlobal][jGlobal+1]==0) ///Derecha  //SF
              {
                Giro180_MicroMouse();
                estDirec = "left";
                estCumCuad[iGlobal][jGlobal]=1; /// para dejar en 2 el cieere total de paredes

                giroMicroMouse = 0;
              } else 
              //    1
              //    R  0
              //    0
              if (parXEst[iGlobal][jGlobal]==1 && //Arriba  //SI
                parXEst[iGlobal+1][jGlobal]==0 && //Abajo  //SD
                parYEst[iGlobal][jGlobal+1]==0) ///Derecha  //SF
              {
                estDirec = "up";
                giroMicroMouse = 0;
                Giro90_MicroMouse();
                if (matFilFlo[iGlobal][jGlobal-1] < matFilFlo[iGlobal][jGlobal])
                {
                  Actualizar_matFilFlo();
                }
              } else 
              //    0
              //    R  0
              //    1
              if (parXEst[iGlobal][jGlobal]==0 && //Arriba  //SI
                parXEst[iGlobal+1][jGlobal]==1 && //Abajo  //SD
                parYEst[iGlobal][jGlobal+1]==0) ///Derecha  //SF
              {
                estDirec = "down";
                giroMicroMouse = 0;
                Giro90_MicroMouse();
                if (matFilFlo[iGlobal][jGlobal-1] < matFilFlo[iGlobal][jGlobal])
                {
                  Actualizar_matFilFlo();
                }
              } else
                //    1
                //    R  1
                //    0
                if (parXEst[iGlobal][jGlobal]==1 && //Arriba ///SensorI
                  parXEst[iGlobal+1][jGlobal]==0 && //Abajo  ///SensorD
                  parYEst[iGlobal][jGlobal+1]==1) //Derecha  ///SensorF
                {
                  //// Derecha                  ////Arriba
                  if (matFilFlo[iGlobal][jGlobal+1]>matFilFlo[iGlobal-1][jGlobal]) 
                  {
                    estDirec = "up";
                    giroMicroMouse = 0;
                    Giro90_MicroMouse();
                    if (matFilFlo[iGlobal][jGlobal-1] < matFilFlo[iGlobal][jGlobal])
                    {
                      Actualizar_matFilFlo();
                    }
                    //println(iGlobal+" "+jGlobal);
                  } 
                  //// Derecha                  ////Arriba
                  if (matFilFlo[iGlobal][jGlobal+1]>matFilFlo[iGlobal-1][jGlobal]) 
                  {
                    if (mouseCoorX>=parX[jGlobal+1]) 
                    {
                      ///MIRAR SI HAY PROBLEMAS///
                      if (matFilFlo[iGlobal][jGlobal-1] < matFilFlo[iGlobal][jGlobal])
                      {
                        Actualizar_matFilFlo();
                      }
                      estCumCuad[iGlobal][jGlobal]++; //// sÃ­ ya se recorrio el cuadro anterior
                      jGlobal++;
                    }
                  }
                }
        }
      } else
        if (estDirec=="down") ///estado de direccion del raton
        {
          if (giroMicroMouse == 0) {
            if (mouseCoorY>=parY[iGlobal+1]) 
            {
              estCumCuad[iGlobal][jGlobal]++;
              iGlobal++;

              giroMicroMouse=1;
            }
          } else 
          {
            //    
            // 0  R  1
            //    1
            if (parYEst[iGlobal][jGlobal]==0 && //izquierda  //SD
              parXEst[iGlobal+1][jGlobal]==1 && //Abajo      //SF
              parYEst[iGlobal][jGlobal+1]==1)  ///Derecha    ///SI
            {
              //// Derecha                  ////Abajo
              if (matFilFlo[iGlobal+1][jGlobal]<=matFilFlo[iGlobal][jGlobal+1])   
              {
                if (mouseCoorY>=parY[iGlobal+1]) 
                {
                  ///MIRAR SI HAY PROBLEMAS///
                  if (matFilFlo[iGlobal-1][jGlobal] < matFilFlo[iGlobal][jGlobal])
                  {
                    Actualizar_matFilFlo();
                  }
                  estCumCuad[iGlobal][jGlobal]++; //// sÃ­ ya se recorrio el cuadro anterior
                  iGlobal++;
                }
              } else
                //// Derecha                  ////Abajo
                if (matFilFlo[iGlobal][jGlobal+1]>matFilFlo[iGlobal+1][jGlobal]) 
                {
                  estDirec = "right";
                  giroMicroMouse = 0;
                  Giro90_MicroMouse();
                  if (matFilFlo[iGlobal][jGlobal] < matFilFlo[iGlobal-1][jGlobal])
                  {
                    Actualizar_matFilFlo();
                  }
                }
            } else
              //    
              // 0  R  1
              //    0
              if (parYEst[iGlobal][jGlobal]==0 && //izquierda  //SD
                parXEst[iGlobal+1][jGlobal]==0 && //Abajo      //SF
                parYEst[iGlobal][jGlobal+1]==1)  ///Derecha    //SI
              {
                estDirec = "right";
                giroMicroMouse = 0;
                Giro90_MicroMouse();
                if (matFilFlo[iGlobal-1][jGlobal] < matFilFlo[iGlobal][jGlobal])
                {
                  Actualizar_matFilFlo();
                }
              } else
                //    
                // 0  R  0
                //    1
                if (parYEst[iGlobal][jGlobal]==0 && //izquierda  //SD
                  parXEst[iGlobal+1][jGlobal]==1 && //Abajo      //SF
                  parYEst[iGlobal][jGlobal+1]==0)  ///Derecha    //SI
                {
                  if (mouseCoorY>=parY[iGlobal+1])  
                  {
                    if (matFilFlo[iGlobal-1][jGlobal] < matFilFlo[iGlobal][jGlobal])
                    {
                      Actualizar_matFilFlo();
                    }
                    estCumCuad[iGlobal][jGlobal]++; //// sÃ­ ya se recorrio el cuadro anterior
                    iGlobal++;
                  }
                } else
                  //    
                  // 1  R  0
                  //    0
                  if (parYEst[iGlobal][jGlobal]==1 && //izquierda  //SD
                    parXEst[iGlobal+1][jGlobal]==0 && //Abajo      //SF
                    parYEst[iGlobal][jGlobal+1]==0)  ///Derecha    //SI
                  {
                    estDirec = "left";
                    giroMicroMouse = 0;
                    Giro90_MicroMouse();
                    if (matFilFlo[iGlobal-1][jGlobal] < matFilFlo[iGlobal][jGlobal])
                    {
                      Actualizar_matFilFlo();
                    }
                  } else
                    //    
                    // 0  R  0
                    //    0
                    if (parYEst[iGlobal][jGlobal]==1 && //izquierda  //SD
                      parXEst[iGlobal+1][jGlobal]==0 && //Abajo      //SF
                      parYEst[iGlobal][jGlobal+1]==0)  ///Derecha    //SI
                    {
                      Giro180_MicroMouse();
                      estDirec = "up";
                      estCumCuad[iGlobal][jGlobal]=1; /// para dejar en 2 el cieere total de paredes

                      giroMicroMouse = 0;
                    } else
                      //    
                      // 1  R  1
                      //    0
                      if (parYEst[iGlobal][jGlobal]==1 && //izquierda  //SD
                        parXEst[iGlobal+1][jGlobal]==0 && //Abajo      //SF
                        parYEst[iGlobal][jGlobal+1]==1)  ///Derecha    //SI
                      {

                        //// Derecha                  ////Izquierda
                        if (matFilFlo[iGlobal][jGlobal+1]<=matFilFlo[iGlobal][jGlobal-1]) 
                        {
                          estDirec = "right";
                          giroMicroMouse = 0;
                          Giro90_MicroMouse();
                          if (matFilFlo[iGlobal-1][jGlobal] < matFilFlo[iGlobal][jGlobal])
                          {
                            Actualizar_matFilFlo();
                          }
                          //println(iGlobal+" "+jGlobal);
                        } else
                          //// Derecha                  ////Izquierda
                          if (matFilFlo[iGlobal][jGlobal+1]>matFilFlo[iGlobal][jGlobal-1]) 
                          {
                            estDirec = "left";
                            giroMicroMouse = 0;
                            Giro90_MicroMouse();
                            if (matFilFlo[iGlobal-1][jGlobal] < matFilFlo[iGlobal][jGlobal])
                            {
                              Actualizar_matFilFlo();
                            }
                          }
                      }
          }
        } else
          if (estDirec=="left")  ///estado de direccion del raton
          {
            if (giroMicroMouse == 0) {
              if (mouseCoorX<=parX[jGlobal-1]) 
              {
                estCumCuad[iGlobal][jGlobal]++;
                jGlobal--;
                giroMicroMouse=1;
              }
            } else 
            {
              //    0
              // 1  R  
              //    0
              if (parXEst[iGlobal][jGlobal]==0 && //Arriba  //SD
                parXEst[iGlobal+1][jGlobal]==0 && //Abajo   //SI
                parYEst[iGlobal][jGlobal]==1) ///Izquierda //SF
              {
                if (mouseCoorX<=parX[jGlobal-1] + (tamCua - tamMouse)) 
                {
                  if (matFilFlo[iGlobal][jGlobal-1] < matFilFlo[iGlobal][jGlobal])
                  {
                    Actualizar_matFilFlo();
                  }
                  estCumCuad[iGlobal][jGlobal]++; //// sÃ­ ya se recorrio el cuadro anterior
                  jGlobal--;
                }
              } else
                //    1
                // 0  R  
                //    0
                if (parXEst[iGlobal][jGlobal]==1 && //Arriba // SD
                  parXEst[iGlobal+1][jGlobal]==0 && //Abajo /// SI
                  parYEst[iGlobal][jGlobal]==0) ///Izquierda ///SF
                {
                  estDirec = "up";
                  giroMicroMouse = 0;
                  Giro90_MicroMouse();
                  if (matFilFlo[iGlobal][jGlobal+1] < matFilFlo[iGlobal][jGlobal])
                  {
                    Actualizar_matFilFlo();
                  }
                } else
                  //    0
                  // 0  R  
                  //    1
                  if (parXEst[iGlobal][jGlobal]==0 && //Arriba // SD
                    parXEst[iGlobal+1][jGlobal]==1 && //Abajo /// SI
                    parYEst[iGlobal][jGlobal]==0) ///Izquierda ///SF
                  {
                    estDirec = "down";
                    giroMicroMouse = 0;
                    Giro90_MicroMouse();
                    if (matFilFlo[iGlobal][jGlobal+1] < matFilFlo[iGlobal][jGlobal])
                    {
                      Actualizar_matFilFlo();
                    }
                  } else
                    //    1
                    // 1  R  
                    //    0
                    if (parXEst[iGlobal][jGlobal]==1 && //Arriba // SD
                      parXEst[iGlobal+1][jGlobal]==0 && //Abajo /// SI
                      parYEst[iGlobal][jGlobal]==1) ///Izquierda ///SF
                    {
                      //// Izquierda                  ////Arriba
                      if (matFilFlo[iGlobal][jGlobal-1]>matFilFlo[iGlobal-1][jGlobal]) 
                      {
                        estDirec = "up";
                        giroMicroMouse = 0;
                        Giro90_MicroMouse();
                        if (matFilFlo[iGlobal][jGlobal+1] < matFilFlo[iGlobal][jGlobal])
                        {
                          Actualizar_matFilFlo();
                        }
                        //println(iGlobal+" "+jGlobal);
                      } 
                      //// Iquierda                  ////Abajo
                      if (matFilFlo[iGlobal][jGlobal-1]>=matFilFlo[iGlobal-1][jGlobal]) 
                      {
                        if (mouseCoorX<=parX[jGlobal-1] + (tamCua - tamMouse)) 
                        {
                          ///MIRAR SI HAY PROBLEMAS///
                          if (matFilFlo[iGlobal][jGlobal+1] < matFilFlo[iGlobal][jGlobal])
                          {
                            Actualizar_matFilFlo();
                          }
                          estCumCuad[iGlobal][jGlobal]++; //// sÃ­ ya se recorrio el cuadro anterior
                          jGlobal--;
                        }
                      }
                    } else
                      //    0
                      // 0  R  
                      //    0
                      if (parXEst[iGlobal][jGlobal]==0 && //Arriba // SD
                        parXEst[iGlobal+1][jGlobal]==0 && //Abajo /// SI
                        parYEst[iGlobal][jGlobal]==0) ///Izquierda ///SF
                      {
                        Giro180_MicroMouse();
                        estDirec = "right";
                        estCumCuad[iGlobal][jGlobal]=1; /// para dejar en 2 el cieere total de paredes

                        giroMicroMouse = 0;
                      } else
                        //    0
                        // 1  R  
                        //    1
                        if (parXEst[iGlobal][jGlobal]==0 && //Arriba // SD
                          parXEst[iGlobal+1][jGlobal]==1 && //Abajo /// SI
                          parYEst[iGlobal][jGlobal]==1) ///Izquierda ///SF
                        {
                          //// Izquierda                  ////Abajo
                          if (matFilFlo[iGlobal][jGlobal-1]<=matFilFlo[iGlobal+1][jGlobal]) 
                          {
                            if (mouseCoorX<=parX[jGlobal-1] + (tamCua - tamMouse)) 
                            {
                              ///MIRAR SI HAY PROBLEMAS///
                              if (matFilFlo[iGlobal][jGlobal-1] < matFilFlo[iGlobal][jGlobal])
                              {
                                Actualizar_matFilFlo();
                              }
                              estCumCuad[iGlobal][jGlobal]++; //// sÃ­ ya se recorrio el cuadro anterior
                              jGlobal--;
                            }
                          } else
                            //// Izquierda                  ////Abajo
                            if (matFilFlo[iGlobal][jGlobal-1]>matFilFlo[iGlobal+1][jGlobal])
                            {
                              estDirec = "down";
                              giroMicroMouse = 0;
                              Giro90_MicroMouse();
                              if (matFilFlo[iGlobal][jGlobal-1] < matFilFlo[iGlobal][jGlobal])
                              {
                                Actualizar_matFilFlo();
                              }
                              //println(iGlobal+" "+jGlobal);
                            }
                        }
            }
          } else
            if (estDirec=="up") 
            {
              if (giroMicroMouse == 0) {
                if (mouseCoorY<=parY[iGlobal]-tamMouse-3) 
                {
                  estCumCuad[iGlobal][jGlobal]++;
                  iGlobal--;
                  giroMicroMouse=1;
                }
              } else 
              {
                //    1
                // 0  R  1
                //    
                if (parYEst[iGlobal][jGlobal]==0 && //izquierda //SI
                  parXEst[iGlobal][jGlobal]==1 && //Arriba    //SF
                  parYEst[iGlobal][jGlobal+1]==1)  ///Derecha //SD
                {
                  //// Derecha                  ////Arriba
                  if (matFilFlo[iGlobal-1][jGlobal]>matFilFlo[iGlobal][jGlobal+1]) 
                  {
                    estDirec = "right";
                    giroMicroMouse = 0;
                    Giro90_MicroMouse();
                    if (matFilFlo[iGlobal+1][jGlobal] < matFilFlo[iGlobal][jGlobal])
                    {
                      Actualizar_matFilFlo();
                    }
                    //println(iGlobal+" "+jGlobal);
                  } else
                    //// Derecha                  ////Arriba
                    if (matFilFlo[iGlobal-1][jGlobal]<=matFilFlo[iGlobal][jGlobal+1]) 
                    {
                      if (mouseCoorY<=parY[iGlobal]-tamMouse-3) 
                      {
                        ///MIRAR SI HAY PROBLEMAS///
                        if (matFilFlo[iGlobal+1][jGlobal] < matFilFlo[iGlobal][jGlobal])
                        {
                          Actualizar_matFilFlo();
                        }
                        estCumCuad[iGlobal][jGlobal]++; //// sÃ­ ya se recorrio el cuadro anterior
                        iGlobal--;
                      }
                    }
                } else

                  //    0
                  // 0  R  1
                  //    
                  if (parYEst[iGlobal][jGlobal]==0 && //izquierda   //SI
                    parXEst[iGlobal][jGlobal]==0 && //Arriba      //SF
                    parYEst[iGlobal][jGlobal+1]==1)  ///Derecha  //SD
                  {
                    estDirec = "right";
                    giroMicroMouse = 0;
                    Giro90_MicroMouse();
                    if (matFilFlo[iGlobal+1][jGlobal] < matFilFlo[iGlobal][jGlobal])
                    {
                      Actualizar_matFilFlo();
                    }
                  } else

                    //    0
                    // 1  R  0
                    //    
                    if (parYEst[iGlobal][jGlobal]==1 && //izquierda   //SI
                      parXEst[iGlobal][jGlobal]==0 && //Arriba      //SF
                      parYEst[iGlobal][jGlobal+1]==0)  ///Derecha  //SD
                    {
                      estDirec = "left";
                      giroMicroMouse = 0;
                      Giro90_MicroMouse();
                      if (matFilFlo[iGlobal+1][jGlobal] < matFilFlo[iGlobal][jGlobal])
                      {
                        Actualizar_matFilFlo();
                      }
                    } else
                      //    1
                      // 0  R  0
                      //    
                      if (parYEst[iGlobal][jGlobal]==0 && //izquierda   //SI
                        parXEst[iGlobal][jGlobal]==1 && //Arriba      //SF
                        parYEst[iGlobal][jGlobal+1]==0)  ///Derecha  //SD
                      {
                        if (mouseCoorY<=parY[iGlobal]-tamMouse-3) 
                        {
                          if (matFilFlo[iGlobal+1][jGlobal] < matFilFlo[iGlobal][jGlobal])
                          {
                            Actualizar_matFilFlo();
                          }
                          estCumCuad[iGlobal][jGlobal]++; //// sÃ­ ya se recorrio el cuadro anterior
                          iGlobal--;
                        }
                      } else
                        //    0
                        // 1  R  1
                        //    
                        if (parYEst[iGlobal][jGlobal]==1 && //izquierda //SI
                          parXEst[iGlobal][jGlobal]==0 && //Arriba    //SF
                          parYEst[iGlobal][jGlobal+1]==1)  ///Derecha //SD
                        {

                          //// Derecha                  ////Izquierda
                          if (matFilFlo[iGlobal][jGlobal+1]>=matFilFlo[iGlobal][jGlobal-1]) 
                          {
                            estDirec = "left";
                            giroMicroMouse = 0;
                            Giro90_MicroMouse();
                            if (matFilFlo[iGlobal+1][jGlobal] < matFilFlo[iGlobal][jGlobal])
                            {
                              Actualizar_matFilFlo();
                            }
                            //println(iGlobal+" "+jGlobal);
                          } else
                            //// Derecha                  ////Izquierda
                            if (matFilFlo[iGlobal][jGlobal+1]<matFilFlo[iGlobal][jGlobal-1]) 
                            {
                              estDirec = "right";
                              giroMicroMouse = 0;
                              Giro90_MicroMouse();
                              if (matFilFlo[iGlobal+1][jGlobal] < matFilFlo[iGlobal][jGlobal])
                              {
                                Actualizar_matFilFlo();
                              }
                            }
                        } else
                          //    0
                          // 0  R  0
                          //    
                          if (parYEst[iGlobal][jGlobal]==0 && //izquierda //SI
                            parXEst[iGlobal][jGlobal]==0 && //Arriba    //SF
                            parYEst[iGlobal][jGlobal+1]==0)  ///Derecha //SD
                          {
                            Giro180_MicroMouse(); ///Giro raton 180 grados o media vuelta
                            estDirec = "down";
                            estCumCuad[iGlobal][jGlobal]=1; /// para dejar en 2 el cieere total de paredes

                            giroMicroMouse = 0;
                          }
              }
            }
    }
  } else
    if (estAlg == "rutaCorta") { ////Despues del aprendizaje escoge la ruta mas corta


      println(iGlobal+" "+jGlobal+ "  "+ estDirec);

      if (jGlobal == llegX && iGlobal == llegY) {
        estDirec = "right";
        estAlg = "terminado";
        mouseCoorX = margenLabX+10;
        mouseCoorY = margenLabY+10;
        delay(3000);
        velX = 0;
        velY = 0;
      } else {
        velX = 8;
        velY = 8;
        if (estDirec=="right") 
        {
          if (giroMicroMouse == 0) {
            if (mouseCoorX>=parX[jGlobal+1]) 
            {
              jGlobal++;

              giroMicroMouse=1;
            }
          } else 
          {
            //    0
            //    R  1
            //    0
            if (parXEst[iGlobal][jGlobal]==0 && //Arriba   ///SensorI
              parXEst[iGlobal+1][jGlobal]==0 && //Abajo    ///SensorD
              parYEst[iGlobal][jGlobal+1]==1) ///Derecha  //SensorF
            {

              if (mouseCoorX>=parX[jGlobal+1]) 
              {

                jGlobal++;
              }
            } else
              //    0
              //    R  1
              //    1
              if (parXEst[iGlobal][jGlobal]==0 && //Arriba ///SensorI
                parXEst[iGlobal+1][jGlobal]==1 && //Abajo  ///SensorD
                parYEst[iGlobal][jGlobal+1]==1) //Derecha  ///SensorF
              {
                //// Derecha                  ////Abajo
                if (matFilFlo[iGlobal][jGlobal+1]<matFilFlo[iGlobal+1][jGlobal])
                {
                  estDirec = "down";
                  giroMicroMouse = 0;
                  Giro90_MicroMouse();
                } 
                //// Derecha                  ////Abajo
                if (matFilFlo[iGlobal][jGlobal+1]>matFilFlo[iGlobal+1][jGlobal])
                {
                  if (mouseCoorX>=parX[jGlobal+1]) 
                  {
                    jGlobal++;
                  }
                }
              } else
                //    0
                //    R  0
                //    0
                if (parXEst[iGlobal][jGlobal]==0 && //Arriba  //SI
                  parXEst[iGlobal+1][jGlobal]==0 && //Abajo   //SD
                  parYEst[iGlobal][jGlobal+1]==0) ///Derecha  //SF
                {
                  Giro180_MicroMouse();
                  estDirec = "left";

                  giroMicroMouse = 0;
                } else 
                //    1
                //    R  0
                //    0
                if (parXEst[iGlobal][jGlobal]==1 && //Arriba  //SI
                  parXEst[iGlobal+1][jGlobal]==0 && //Abajo  //SD
                  parYEst[iGlobal][jGlobal+1]==0) ///Derecha  //SF
                {
                  estDirec = "up";
                  giroMicroMouse = 0;
                  Giro90_MicroMouse();
                } else 
                //    0
                //    R  0
                //    1
                if (parXEst[iGlobal][jGlobal]==0 && //Arriba  //SI
                  parXEst[iGlobal+1][jGlobal]==1 && //Abajo  //SD
                  parYEst[iGlobal][jGlobal+1]==0) ///Derecha  //SF
                {
                  estDirec = "down";
                  giroMicroMouse = 0;
                  Giro90_MicroMouse();
                } else
                  //    1
                  //    R  1
                  //    0
                  if (parXEst[iGlobal][jGlobal]==1 && //Arriba ///SensorI
                    parXEst[iGlobal+1][jGlobal]==0 && //Abajo  ///SensorD
                    parYEst[iGlobal][jGlobal+1]==1) //Derecha  ///SensorF
                  {
                    //// Derecha                  ////Arriba
                    if (matFilFlo[iGlobal][jGlobal+1]<matFilFlo[iGlobal-1][jGlobal])
                    {
                      estDirec = "up";
                      giroMicroMouse = 0;
                      Giro90_MicroMouse();
                    } 
                    //// Derecha                  ////Arriba
                    if (matFilFlo[iGlobal][jGlobal+1]<matFilFlo[iGlobal-1][jGlobal])
                    {
                      if (mouseCoorX>=parX[jGlobal+1]) 
                      {

                        jGlobal++;
                      }
                    }
                  }
          }
        } else
          if (estDirec=="down") 
          {
            if (giroMicroMouse == 0) {
              if (mouseCoorY>=parY[iGlobal+1]) 
              {
                iGlobal++;

                giroMicroMouse=1;
              }
            } else 
            {
              //    
              // 0  R  1
              //    1
              if (parYEst[iGlobal][jGlobal]==0 && //izquierda  //SD
                parXEst[iGlobal+1][jGlobal]==1 && //Abajo      //SF
                parYEst[iGlobal][jGlobal+1]==1)  ///Derecha    ///SI
              {
                //// Derecha                  ////Abajo
                if (matFilFlo[iGlobal][jGlobal+1]>matFilFlo[iGlobal+1][jGlobal])
                {
                  estDirec = "right";
                  giroMicroMouse = 0;
                  Giro90_MicroMouse();
                } else
                  //// Derecha                  ////Abajo
                  if (matFilFlo[iGlobal][jGlobal+1]< matFilFlo[iGlobal+1][jGlobal])
                  {
                    if (mouseCoorY>=parY[iGlobal+1]) 
                    {
                      iGlobal++;
                    }
                  }
              } else
                //    
                // 0  R  1
                //    0
                if (parYEst[iGlobal][jGlobal]==0 && //izquierda  //SD
                  parXEst[iGlobal+1][jGlobal]==0 && //Abajo      //SF
                  parYEst[iGlobal][jGlobal+1]==1)  ///Derecha    //SI
                {
                  estDirec = "right";
                  giroMicroMouse = 0;
                  Giro90_MicroMouse();
                } else
                  //    
                  // 0  R  0
                  //    1
                  if (parYEst[iGlobal][jGlobal]==0 && //izquierda  //SD
                    parXEst[iGlobal+1][jGlobal]==1 && //Abajo      //SF
                    parYEst[iGlobal][jGlobal+1]==0)  ///Derecha    //SI
                  {
                    if (mouseCoorY>=parY[iGlobal+1])  
                    {
                      iGlobal++;
                    }
                  } else
                    //    
                    // 1  R  0
                    //    0
                    if (parYEst[iGlobal][jGlobal]==1 && //izquierda  //SD
                      parXEst[iGlobal+1][jGlobal]==0 && //Abajo      //SF
                      parYEst[iGlobal][jGlobal+1]==0)  ///Derecha    //SI
                    {
                      estDirec = "left";
                      giroMicroMouse = 0;
                      Giro90_MicroMouse();
                    } else
                      //    
                      // 0  R  0
                      //    0
                      if (parYEst[iGlobal][jGlobal]==1 && //izquierda  //SD
                        parXEst[iGlobal+1][jGlobal]==0 && //Abajo      //SF
                        parYEst[iGlobal][jGlobal+1]==0)  ///Derecha    //SI
                      {
                        Giro180_MicroMouse();
                        estDirec = "up";

                        giroMicroMouse = 0;
                      } else
                        //    
                        // 1  R  1
                        //    0
                        if (parYEst[iGlobal][jGlobal]==1 && //izquierda  //SD
                          parXEst[iGlobal+1][jGlobal]==0 && //Abajo      //SF
                          parYEst[iGlobal][jGlobal+1]==1)  ///Derecha    //SI
                        {

                          //// Derecha                  ////Izquierda
                          if ((matFilFlo[iGlobal][jGlobal+1]>=matFilFlo[iGlobal][jGlobal-1]) &&
                            estCumCuad[iGlobal][jGlobal+1] == 1)
                          {
                            estDirec = "right";
                            giroMicroMouse = 0;
                            Giro90_MicroMouse();
                          } else
                            //// Derecha                  ////Izquierda
                            if ((matFilFlo[iGlobal][jGlobal+1]<=matFilFlo[iGlobal][jGlobal-1]) ||
                              estCumCuad[iGlobal][jGlobal-1] == 1)
                            {
                              estDirec = "left";
                              giroMicroMouse = 0;
                              Giro90_MicroMouse();
                            }
                        }
            }
          } else
            if (estDirec=="left") ///estado de direccion del raton
            {
              if (giroMicroMouse == 0) {
                if (mouseCoorX<=parX[jGlobal-1]) 
                {
                  jGlobal--;
                  giroMicroMouse=1;
                }
              } else 
              {
                //    0
                // 1  R  
                //    0
                if (parXEst[iGlobal][jGlobal]==0 && //Arriba  //SD
                  parXEst[iGlobal+1][jGlobal]==0 && //Abajo   //SI
                  parYEst[iGlobal][jGlobal]==1) ///Izquierda //SF
                {
                  if (mouseCoorX<=parX[jGlobal-1] + (tamCua - tamMouse)) 
                  {

                    jGlobal--;
                  }
                } else
                  //    1
                  // 0  R  
                  //    0
                  if (parXEst[iGlobal][jGlobal]==1 && //Arriba // SD
                    parXEst[iGlobal+1][jGlobal]==0 && //Abajo /// SI
                    parYEst[iGlobal][jGlobal]==0) ///Izquierda ///SF
                  {
                    estDirec = "up";
                    giroMicroMouse = 0;
                    Giro90_MicroMouse();
                  } else
                    //    0
                    // 0  R  
                    //    1
                    if (parXEst[iGlobal][jGlobal]==0 && //Arriba // SD
                      parXEst[iGlobal+1][jGlobal]==1 && //Abajo /// SI
                      parYEst[iGlobal][jGlobal]==0) ///Izquierda ///SF
                    {
                      estDirec = "down";
                      giroMicroMouse = 0;
                      Giro90_MicroMouse();
                    } else
                      //    1
                      // 1  R  
                      //    0
                      if (parXEst[iGlobal][jGlobal]==1 && //Arriba // SD
                        parXEst[iGlobal+1][jGlobal]==0 && //Abajo /// SI
                        parYEst[iGlobal][jGlobal]==1) ///Izquierda ///SF
                      {
                        //// Izquierda                  ////Arriba
                        if (matFilFlo[iGlobal][jGlobal-1]<matFilFlo[iGlobal-1][jGlobal])
                        {
                          estDirec = "up";
                          giroMicroMouse = 0;
                          Giro90_MicroMouse();
                        } 
                        //// Iquierda                  ////Abajo
                        if (matFilFlo[iGlobal][jGlobal-1]>matFilFlo[iGlobal-1][jGlobal])
                        {
                          if (mouseCoorX<=parX[jGlobal-1] + (tamCua - tamMouse)) 
                          {

                            jGlobal--;
                          }
                        }
                      } else
                        //    0
                        // 0  R  
                        //    0
                        if (parXEst[iGlobal][jGlobal]==0 && //Arriba // SD
                          parXEst[iGlobal+1][jGlobal]==0 && //Abajo /// SI
                          parYEst[iGlobal][jGlobal]==0) ///Izquierda ///SF
                        {
                          Giro180_MicroMouse();
                          estDirec = "right";

                          giroMicroMouse = 0;
                        } else
                          //    0
                          // 1  R  
                          //    1
                          if (parXEst[iGlobal][jGlobal]==0 && //Arriba // SD
                            parXEst[iGlobal+1][jGlobal]==1 && //Abajo /// SI
                            parYEst[iGlobal][jGlobal]==1) ///Izquierda ///SF
                          {
                            //// Izquierda                  ////Abajo
                            if (matFilFlo[iGlobal][jGlobal-1]<=matFilFlo[iGlobal+1][jGlobal])
                            {
                              if (mouseCoorX<=parX[jGlobal-1] + (tamCua - tamMouse)) 
                              {

                                jGlobal--;
                              }
                            } else
                              //// Izquierda                  ////Abajo
                              if (matFilFlo[iGlobal][jGlobal-1]>matFilFlo[iGlobal+1][jGlobal])
                              {
                                estDirec = "down";
                                giroMicroMouse = 0;
                                Giro90_MicroMouse();
                              }
                          }
              }
            } else
              if (estDirec=="up") ///estado de direccion del raton
              {
                if (giroMicroMouse == 0) {
                  if (mouseCoorY<=parY[iGlobal]-tamMouse-3) 
                  {
                    iGlobal--;
                    giroMicroMouse=1;
                  }
                } else 
                {
                  //    1
                  // 0  R  1
                  //    
                  if (parYEst[iGlobal][jGlobal]==0 && //izquierda //SI
                    parXEst[iGlobal][jGlobal]==1 && //Arriba    //SF
                    parYEst[iGlobal][jGlobal+1]==1)  ///Derecha //SD
                  {
                    //// Derecha                  ////Arriba
                    if (matFilFlo[iGlobal-1][jGlobal]<matFilFlo[iGlobal][jGlobal+1])
                    {
                      estDirec = "right";
                      giroMicroMouse = 0;
                      Giro90_MicroMouse();
                    } else
                      //// Derecha                  ////Arriba
                      if (matFilFlo[iGlobal-1][jGlobal]>matFilFlo[iGlobal][jGlobal+1])
                      {
                        if (mouseCoorY<=parY[iGlobal]-tamMouse-3) 
                        {
                          iGlobal--;
                        }
                      }
                  } else

                    //    0
                    // 0  R  1
                    //    
                    if (parYEst[iGlobal][jGlobal]==0 && //izquierda   //SI
                      parXEst[iGlobal][jGlobal]==0 && //Arriba      //SF
                      parYEst[iGlobal][jGlobal+1]==1)  ///Derecha  //SD
                    {
                      estDirec = "right";
                      giroMicroMouse = 0;
                      Giro90_MicroMouse();
                    } else

                      //    0
                      // 1  R  0
                      //    
                      if (parYEst[iGlobal][jGlobal]==1 && //izquierda   //SI
                        parXEst[iGlobal][jGlobal]==0 && //Arriba      //SF
                        parYEst[iGlobal][jGlobal+1]==0)  ///Derecha  //SD
                      {
                        estDirec = "left";
                        giroMicroMouse = 0;
                        Giro90_MicroMouse();
                      } else
                        //    1
                        // 0  R  0
                        //    
                        if (parYEst[iGlobal][jGlobal]==0 && //izquierda   //SI
                          parXEst[iGlobal][jGlobal]==1 && //Arriba      //SF
                          parYEst[iGlobal][jGlobal+1]==0)  ///Derecha  //SD
                        {
                          if (mouseCoorY<=parY[iGlobal]-tamMouse-3) 
                          {

                            iGlobal--;
                          }
                        } else
                          //    0
                          // 1  R  1
                          //    
                          if (parYEst[iGlobal][jGlobal]==1 && //izquierda //SI
                            parXEst[iGlobal][jGlobal]==0 && //Arriba    //SF
                            parYEst[iGlobal][jGlobal+1]==1)  ///Derecha //SD
                          {
                            //// Derecha                  ////Izquierda
                            if (matFilFlo[iGlobal][jGlobal+1]>matFilFlo[iGlobal][jGlobal-1])
                            {
                              estDirec = "right";
                              giroMicroMouse = 0;
                              Giro90_MicroMouse();
                            } else
                              //// Derecha                  ////Izquierda
                              if (matFilFlo[iGlobal][jGlobal-1]<matFilFlo[iGlobal][jGlobal+1]) 
                              {
                                estDirec = "right";
                                giroMicroMouse = 0;
                                Giro90_MicroMouse();
                              }
                          } else
                            //    0
                            // 0  R  0
                            //    
                            if (parYEst[iGlobal][jGlobal]==0 && //izquierda //SI
                              parXEst[iGlobal][jGlobal]==0 && //Arriba    //SF
                              parYEst[iGlobal][jGlobal+1]==0)  ///Derecha //SD
                            {
                              Giro180_MicroMouse();
                              estDirec = "down";

                              giroMicroMouse = 0;
                            }
                }
              }
      }
    }
}

void Giro90_MicroMouse() {
  delay(300);
}
void Giro180_MicroMouse() {
  delay(600);
}
void Actualizar_matFilFlo() {

  for (int i = 0; i < nCua; i++) {
    for (int j = 0; j < nCua; j++) {
      if (estCumCuad[i][j]==1) {
        matFilFlo[i][j]+=2;
      }
    }
  }
}
void ImagenMouse(String sentido) { ///Cambio de imagen segun la direccion

  if (sentido == "up") foto = loadImage("mouse_up.png");
  if (sentido == "left") foto = loadImage("mouse_left.png");
  if (sentido == "down") foto = loadImage("mouse_down.png");
  if (sentido == "right") foto = loadImage("mouse_right.png");
}