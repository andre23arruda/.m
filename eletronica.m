classdef eletronica
    %Métodos para alguns cálculos de eletrônica
    %   Detailed explanation goes here
    
    properties
        Property1
    end
    
    methods (Static)
        function [m1] = multiplos(m1)
            %UNTITLED2 Construct an instance of this class
            %   Detailed explanation goes here
            m1 = num2str(m1);
            multiplo_m1 = m1(end);
            if ~isnan(str2double(multiplo_m1))
                multiplo_m1 = '1';
                m1(end+1) = '1';
            end
            m1 = str2double(m1(1:end-1));
            multiplos = {'p';'n';'u';'1';'k';'M'};
            valores = [10^-12;10^-9;10^-6;1;10^3;10^6];
            T = table(valores,'RowNames',multiplos);
            m1 = m1 * table2array(T(multiplo_m1,1));
        end
        
        function V = tensao(m1,m2,s)
            %UNTITLED2 Construct an instance of this class
            %   Detailed explanation goes here
            [R] = eletronica.multiplos(m1);
            [I] = eletronica.multiplos(m2);
            V = R*I;
            if nargin == 3
                display(['A tensão é de ',num2str(V),'V']);
            end
        end
        
        function I = corrente(m1,m2,s)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            [V] = eletronica.multiplos(m1);
            [R] = eletronica.multiplos(m2);
            I = V/R;
            if nargin == 3
                display(['A corrente é de ',num2str(I),'A']);
            end
        end
        
        function R = resistencia(V,I,s)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            [V] = eletronica.multiplos(V);
            [I] = eletronica.multiplos(I);
            R = V/I;
            if nargin == 3
                fprintf('A resistencia necessária é de %3.2E Ohm \n', R);
            end
        end
        
        function Req = paralelo(m1,m2,s)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            [R1] = eletronica.multiplos(m1);
            [R2] = eletronica.multiplos(m2);
            Req = (R1*R2)/(R1+R2);
            if nargin == 3
                display(['A resistencia equivalente é de ',num2str(Req),' Ohm']);
            end
        end
        
        function Vc = tensao_carga(V,R1,R2,s)
            %UNTITLED2 Construct an instance of this class
            %   Detailed explanation goes here
            [V] = eletronica.multiplos(V);
            [R1] = eletronica.multiplos(R1);
            [R2] = eletronica.multiplos(R2);
            Vc = V*R1/(R1+R2);
            if nargin == 4
%                 display(['A tensão é de ',num2str(Vc),'V']);
                fprintf('A tensão é de %3.2E V \n', Vc);
            end
        end
        
        function Ic = corrente_carga(I,R1,R2,s)
            %UNTITLED2 Construct an instance of this class
            %   Detailed explanation goes here
            [I] = eletronica.multiplos(I);
            [R1] = eletronica.multiplos(R1);
            [R2] = eletronica.multiplos(R2);
            Ic = I*R2/(R1+R2);
            if nargin == 4
                fprintf('A corrente é de %3.2E A \n',Ic);
            end
        end
        
        function fc = frequenciaCorte(C,R,s)
            %UNTITLED2 Construct an instance of this class
            %   Detailed explanation goes here
            [C] = eletronica.multiplos(C);
            [R] = eletronica.multiplos(R);
            fc = 1/(2*pi*R*C);
            if nargin == 3
                fprintf('A frequencia de corte é de %.2f Hz \n',fc);
            end
        end
        
        function R = calcResistorFc(C,Fc,s)
            %UNTITLED2 Construct an instance of this class
            %   Detailed explanation goes here
            [C] = eletronica.multiplos(C);
            [Fc] = eletronica.multiplos(Fc);
            R = 1/(2*pi*Fc*C);
            if nargin == 3
                  fprintf('O resistor necessário para a frequencia de %.u Hz precisa ter %3.2E Ohm \n',Fc,R);
            end
        end
        
    end
end

