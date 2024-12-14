%   función para el browniano
%   tiene como entrada el valor j
%   y da como resultado la gráfica del Browniano

function grafica = braw(varargin)

    j = varargin{1};    
    numero_muestras= 1024;   
%     disp(numero_muestras)
    t=zeros(numero_muestras,1);

%  _____________________________________________
%   Construyo el vector de tiempo

    for i=2:1:numero_muestras   %    construyo el vector de tiempo
        t(i) = t(i-1)+1/numero_muestras;
    end

% Genero los valores aleatorios para la n ondas
    
    z_n = randn(1,1);

% Construyo la integral Madre original

    delta=zeros(numero_muestras,1);
    for i=1:1:numero_muestras    
        if t(i) <= 0.5
            delta(i) = 2*t(i);
        else
            delta(i) = 2*(1-t(i));
        end    
    end

    delta = z_n(1)*delta;
    plot(delta);

% Calculo el índice K'esismo  y los n elementos 

    k_esimo = 2^j;          
    k=zeros(k_esimo,1);
    for i=0:1:k_esimo-1
        k(i+1)=i; 
    end                     %  0 <= k < 2^j

%     disp(k);
    num_k=size(k,1);

    n = zeros(num_k,1);
    for z=1:1:num_k
        n(z)= 2^j + k(z);
    end                     % n = 2^j + k

%     disp(n);
    
%   Calculo el rango para cada onda

    rango = round(numero_muestras/(2^j));

%    

delta_n = zeros(num_k,1);
z_n = randn(num_k,1);


    for w=1:1:num_k
    
        lamba_n = 0.5*(2^(-j/2));

        for i=1+(rango)*(w-1):1:rango+(rango)*(w-1)
            delta_n(i) = delta((2^j)*i-k(w)*(numero_muestras));
        end
        ii =1+(rango)*(w-1):1:rango+(rango)*(w-1);
        delta_n(ii) = z_n(w)*delta_n(ii);

%         plot(delta_n);
    end

    delta_n(:) = lamba_n*delta_n(:) + randn(1,1)*.5*t(:);
    plot(delta_n);
    
grafica = delta_n;
    



