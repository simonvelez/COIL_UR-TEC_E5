%{ 
     Fase 2 - Flujo alrededor de un obstáculo elíptico: funciones armónicas y curvas de nivel 
     COIL UR - TEC
     Equipo 5
     2025
%} 

% Parámetros
U = 0.01;     % Velocidad del flujo (m/s)
R = 32;     % Radio del cilindro (m)
N = 200;   % Resolución de la malla

% Malla
x = linspace(-100, 100, N);   % Rangos para x y y
y = linspace(-100, 100, N);
[X, Y] = meshgrid(x, y);
Z = X + 1i * Y;           % Variable compleja

% Evitar división por cero (evita z=0)
Z(Z == 0) = eps;
    
% Función compleja f(x,y) = f(z) = U * (z + R^2/z)
fcom = U * (Z + R^2 ./ Z);

% Función de corriente fcor = Im(f)
fcor = imag(fcom);

% Número de niveles y límites deseados
niveles = linspace(-5, 5, 100);  % rango y cuántas líneas
% Graficar las líneas de corriente
figure;
contour(X, Y, fcor, niveles, 'LineWidth', 1);
colormap(turbo);       % Escoger paleta de colores
colorbar;              % Barra de colores
hold on;

% Dibujar el círculo de radio R (obstáculo) y rellenarlo
theta = linspace(0, 2*pi, 200);
xc = R * cos(theta);
yc = R * sin(theta);
fill(xc, yc, 'k');    

axis equal;    % Ejes con la misma escala
xlabel('x (m)');
ylabel('y (m)');
title('Líneas de Corriente (Im(f))');
