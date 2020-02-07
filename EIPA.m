%EIPA for ELEC 4700 PA5
%Philippe Masson


numX = 50;
numY = 50;
delta = 1;

GMatrix = zeros(numX*numY,numX*numY);
VMatrix = zeros(1,numX*numY);


for i = 1:numX
    for j = 1:numY
        n = j+(i-1)*numY;
        nxm = j+(i-2)*numY;
        nxp = j + i*numY;
        nym = j-1+(i-1)*numY;
        nyp = j+1 + (i-1)*numY;
        
        if(i == 1 || j == 1 || i == numX || j ==numY)
           GMatrix(n,n) = 1;
        else
            if(i > 10 && i < 20 && j > 10 && j < 20)
                GMatrix(n,n) = -2;
            else
                GMatrix(n,n) = -4;
            end
            
            GMatrix(nxm,n) = 1;
            GMatrix(nxp,n) = 1;
            GMatrix(n,nym) = 1;
            GMatrix(n,nyp) = 1;
        end      
        
    end    
end
figure(1)
spy(GMatrix)


[E,D] = eigs(GMatrix,9,'SM');

jC = 1;
iC = 1;
figure(2);
tiledlayout(3,3);

mapMatrix = zeros(numX,numY);
for mapCount = 1:9
    for count = 1:numX*numY

        mapMatrix(iC,jC) = E(count,mapCount);

        if (jC == 50)
            jC = 1;
            iC = iC + 1;        
        else
            jC = jC + 1;
        end
    end
    
    nexttile(mapCount);
    surf(mapMatrix);

end