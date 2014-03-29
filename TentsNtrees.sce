x = 7  // leeg vakje (geel) 
g = 3  // gras (lichtgroen)
b = 13 // boom (donkergroen)
t = 6 // tent (paars)


function B = solveTentjeBoompje(A,R,K)
   
    // Voeg code toe die de gegeven Tentje Boompje puzzel
    // oplost. Implementeer een nieuwe functie voor elke
    // bijkomende strategie die je toepast.
    
    
    B = A
    
    // Werkwijze
    // ------
    // Vul eerst alle rijen en kolommen in waar een 0 bij staat.
    // Voeg gras toe aan vakjes die niet aan een boom grenzen.
    // Indien de rij (of kolom) evenveel lege vakjes heeft als aantal benodigd, vul je deze in met tentjes.
    
    //check of dat in de Rijvector een 0 staat.
    for i = 1 : length(R)
        if R(i) == 0
           // doorloop i-de rij
           for j =  1 : length(K)
               if(B(i,j) == x & B(i,j) == x)
                   // verander dit door gras
                   B(i,j) = g
               end
           end
        end
    end
     //check of dat in de Kolomvector een 0 staat.
    for i = 1 : length(K)
        if K(i) == 0
           // doorloop i-de kolom
           for j =  1 : length(R)
               if(B(j,i) == x &  B(j,i) == x)
                   // verander dit door gras
                   B(j,i) = g
               end
           end
        end
    end
    
    //ok
    
    // Kijk of er in de buurt een boom staat
    for i = 1 : length(R)
        for j = 1 : length(K)
            // Controleer of dat links,rechts,onder en boven geen boom staat
            if (A(i ,j)<> b) & (A(max(i-1,1),j)<> b) & (A(min(i+1,length(R)),j)<> b) & (A(i,max(j-1,1)))<>b & (A(i,min(j+1,length(K)))<> b &  B(i,j) == x) then 
                B(i,j) = g
            end
        end
    end
    
   placeTentjes(A,R,K,B)
   //Matplot(B)
endfunction

function placeTentjes(A,R,K,B)
 // TENTJES ZETTEN 
 
 [rB,kB] = size(B) 
  AantalLegeVakjes = [ ]
    
         // kijken naar vector kolom hoeveel vakjes er tentjes moeten zijn
     for(i=1:kB)
         aantalLegeVakjes(i) = 0
         for(j=1:rB)
             if B(j,i) == x then
                 aantalLegeVakjes(i) = aantalLegeVakjes(i) + 1
             end
            
         end
        end
        for(i=1:kB)
         if aantalLegeVakjes(i) == K(i) then
             for(j=1:rB)
                 if B(j,i) ==x then
                     B(j,i) = t
                 end
             end
         end
     end
     
     
     // kijken naar vector rij hoeveel vakjes er tentjes moeten zijn
     
     aantalLegeVakjes = [ ]
     for(i=1:rB)
         aantalLegeVakjes(i) = 0
         for(j=1:kB)
             if B(i,j) == x then
                 aantalLegeVakjes(i) = aantalLegeVakjes(i) + 1
             end
             if B(i,j) == t then
               aantalLegeVakjes(i) = aantalLegeVakjes(i) + 1
             end
         end
        end
        for(i=1:rB)
         if aantalLegeVakjes(i) == R(i) then
             for(j=1:kB)
                 if B(i,j) ==x then
                     B(i,j) = t
                 end
             end
         end
     end
     
         
     for i=1:length(R)
         for j=1:length(K)
             if B(i,j)==t then
                 for k=max(i-1,1):min(i+1,length(R))
                     for l=max(j-1,1):min(j+1,length(K))
                         if B(l,k)==x then B(l,k)=g
                         end
                     end
                 end
             end
         end
     end
     
     Matplot(B)
     return
    disp('test')

  
     // linkerbovenhoek
       if B(1,1) == x then
            if B(2,1) <> x & B(1,2) <> x & B(2,1) <> t & B(1,2) <> t & B(1,1) == x then
                B(1,1) = t
            else
                 B(1,1) = g
            end   
       end
       //ok
    // rechterbovenhoek
           if B(1,kB) == x then
            if B(2,kB) <> x & B(1,kB-1) <> x & B(2,kB) <> t & B(1,kB-1) <> t & B(1,kB) == x then
                B(1,kB) = t
            else
                 B(1,kB) = g
            end   
       end
    
    // linkeronderhoek
           if B(rB,1) == x then
            if B(rB-1,1) <> x & B(rB,2) <> x & B(rB-1,1) <> t & B(rB,2) <> t & B(rB,1) == x then
                B(rB,1) = t
            else
                 B(rB,1) = g
            end   
       end
    
    // rechteronderhoek
           if B(rB,kB) == x then
            if B(rB-1,kB) <> x & B(rB,kB-1) <> x & B(rB-1,kB) <> t & B(rB,kB-1) <> t & B(rB,kB) == x then
                B(rB,kB) = t
            end   
       end
       
       //midden
       
       for i = 2: kB-1
           for j  = 2 : rB -1
           if B(i-1,j)<> x & B(i-1,j) <> t & B(i+1,j)<> x & B(i+1,j) <> t & B(i,j-1)<> x & B(i,j-1) <> t & B(i,j+1)<> x & B(i,j+1) <> t & B(i-1,j-1) <> t & B(i+1,j+1) <> t & B(i+1,j-1) <> t & B(i-1,j+1) <> t & B(i,j) == x then
               B(i,j) = t
           end
           end
     end
       
    Matplot(B)
endfunction


// voorbeeld

A1 = [x b b x x; 
      x x x x b; 
      x x x x x; 
      x x x x b; 
      x b x x x]
K1 = [2 0 0 1 2] 
R1 = [2 0 1 0 2]   
B1 = [t b b t g; 
      g g g g b; 
      g g g g t; 
      g g g g b; 
      t b g g t]

// voorbeeld 2

A2 = [x b x x x; 
      x x x x b; 
      x x b x x; 
      x x x x b; 
      x x b x x]
K2 = [1 1 0 1 2] 
R2 = [2 0 2 0 1]   
B2 = [t b g g t; 
      g g g g b; 
      g t b g t; 
      g g g g b; 
      g g b t g]
      
solveTentjeBoompje(A1,R1,K1)
