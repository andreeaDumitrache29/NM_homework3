function value = demo(img1_in, img2_in)
%verifica functia inverse_mapping pentru 3 transformari
%functia primeste ca parametru calea catre cele doua imagini de test
%se vor aplica: scalarea cu 0.4, rotatie cu pi/4 si rotirea fata de orizontala
%se vor crea pozele corespunzatoare pentru cele transformari

%matricele transformarilor
T1 = [0.4 0; 0 0.4];
T2 = [cos(pi/4) -sin(pi/4); sin(pi/4) cos(pi/4)];
T3 = [cos(pi) -sin(pi);sin(pi) cos(pi)];

%numele celor doua imagini
nume1 = img1_in(1:length(img1_in) - 4);
nume2 = img2_in(1:length(img2_in) - 4);

%imaginile obinute pentru scalarea cu 0.4
A = inverse_mapping(img1_in, T1);
A2 = inverse_mapping(img2_in, T1);
imwrite(mat2gray(A), strcat(nume1, "_scalare.png"));
imwrite(mat2gray(A2),strcat(nume2, "_scalare.png"));

%imaginilie obtinute pentru rotatia cu 45 de grade
B = inverse_mapping(img1_in, T2);
B1 = inverse_mapping(img2_in, T2);
imwrite(mat2gray(B), strcat(nume1, "_rotatie45.png"));
imwrite(mat2gray(B1),strcat(nume2, "_rotatie45.png"));

%imaginile obtinute pentru rotirea fata de orizontala
C = inverse_mapping(img1_in, T3);
C1 = inverse_mapping(img2_in, T3);
imwrite(mat2gray(C), strcat(nume1, "_rotatie180.png"));
imwrite(mat2gray(C1), strcat(nume2, "_rotatie180.png"));

end
