 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% NAME: magnifyOnFigure_examples
% 
% AUTHOR: David Fernandez Prim (david.fernandez.prim@gmail.com)
% REVISION: Hildo Guillardi J?nior
%
% PURPOSE: Shows the funcionality of 'magnifyOnFigure'
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc
clear
close all

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Default interactive mode
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all
fprintf('This is the default interactive operation mode of ''magnifyOnFigure''\n')  

hold on
plot(rand(100,1), 'b'); 
plot(rand(300, 1), 'r'); 
grid on
hold off
magnifyOnFigure;


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Figure handle passed as an input argument
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all
 fprintf('The figure handle is here passed as an input argument.\n')  
fig = figure;
hold on
plot(rand(100,1), 'b'); 
plot(rand(300, 1), 'r'); 
grid on
hold off
magnifyOnFigure(fig);



%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Properties (in interactive mode)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all
 fprintf('Playing arround with the properties in interactive mode...\n')  
figHandler = figure;
hold on
plot(rand(100,1), 'b'); 
% plot(rand(300, 1), 'r'); 
grid on
hold off 
ylim([0 1]);
magnifyOnFigure(...
        figHandler,...
        'magnifierShape', 'ellipse',...
        'initialPositionSecondaryAxes', [326.933 259.189 164.941 102.65],...
        'initialPositionMagnifier',     [1 1 43 340]...       
            ); 


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Properties (in manual mode)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all
 fprintf('Or in manual mode.\n')  
figHandler = figure;
hold on
plot(rand(100,1), 'b'); 
plot(rand(300, 1), 'r'); 
grid on
hold off 
ylim([0 2]);
magnifyOnFigure(...
        figHandler,...
        'units', 'pixels',...
        'initialPositionSecondaryAxes', [326.933 259.189 164.941 102.65],...
        'initialPositionMagnifier',     [174.769 49.368 14.1164 174.627],...    
        'mode', 'manual',...    
        'displayLinkStyle', 'straight',...        
        'edgeWidth', 2,...
        'edgeColor', 'red',...
        'secondaryAxesFaceColor', [0.91 0.91 0.91]... 
            ); 



%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Working on images also
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all
 fprintf('How the tool works on images.\n')  
h = figure; 
load clown; 
image(X); 
colormap(map) ; 
axis image
magnifyOnFigure(h, 'displayLinkStyle', 'straight',...
                    'EdgeColor', 'white',...
                    'magnifierShape', 'rectangle',...
                    'frozenZoomAspectratio', 'on',...
                    'edgeWidth', 2);

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Working on contour plots
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all
 fprintf('How the tool works on contour plots.\n')  
scrsz = get(0, 'ScreenSize');
h = figure('Position', [0.01*scrsz(3), 0.25*scrsz(4), 0.65*scrsz(3), 0.60*scrsz(4)]);
load clown;
hc1 = contour(X, 'LineWidth', 2);
axis image

magnifyOnFigure;


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Properties (in interactive mode)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all
 fprintf('Using multiple magnifiers on the same axis...\n')  
figHandler = figure;
hold on
plot(rand(100,1), 'b'); 
plot(rand(300, 1), 'r'); 
grid on
hold off 
ylim([0 2]);

magnifyOnFigure(...
        figHandler,...
        'units', 'pixels',...
        'magnifierShape', 'rectangle',...
        'initialPositionSecondaryAxes', [105.6 278.81 130.2 102.69],...
        'initialPositionMagnifier',     [106.56 47.2 18.6823 186.519],...    
        'mode', 'interactive',...    
        'displayLinkStyle', 'straight',...        
        'edgeWidth', 2,...
        'edgeColor', 'black',...
        'secondaryAxesFaceColor', [0.91 0.91 0.91]... 
            );   

magnifyOnFigure(...
        figHandler,...
        'units', 'pixels',...
        'magnifierShape', 'rectangle',...
        'initialPositionSecondaryAxes', [365.6 275.81 130.2 102.69],...
        'initialPositionMagnifier',     [211.459 47.2 18.6823 186.519],...    
        'mode', 'interactive',...    
        'displayLinkStyle', 'straight',...        
        'edgeWidth', 2,...
        'edgeColor', 'black',...
        'secondaryAxesFaceColor', [0.91 0.91 0.91]... 
            );   
        
magnifyOnFigure(...
        figHandler,...
        'units', 'pixels',...
        'magnifierShape', 'rectangle',...
        'initialPositionSecondaryAxes', [364.6 78.81 130.2 102.69],...
        'initialPositionMagnifier',     [270.827 47.2 18.6823 186.519],...    
        'mode', 'interactive',...    
        'displayLinkStyle', 'straight',...        
        'edgeWidth', 2,...
        'edgeColor', 'black',...
        'secondaryAxesFaceColor', [0.91 0.91 0.91]... 
            ); 

        


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Log graph
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


close all
 fprintf('''magnifyOnFigure'' in a logarithm X graph plot\n')  

plot(rand(100,1), 'b')
grid on
set(gca, 'XScale', 'log')
magnifyOnFigure;


close all
 fprintf('''magnifyOnFigure'' in a logarithm Y graph plot\n')  

plot(rand(100,1), 'b')
grid on
set(gca, 'YScale', 'log')
magnifyOnFigure;
