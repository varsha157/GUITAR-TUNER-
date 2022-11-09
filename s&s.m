
% GUITAR TUNER USING MATLAB CODE

clc
clear all
 
x=1;
 
while x==1,
    
    x=isempty (input ('Press enter to start program or press zero to quit. '));
    
    ghighE=1318.1505;
    
    gB=987.7669;
    
    gG=783.9911;
    
    gD=587.3297;
    
    gA=440;
    
    glowE=329.6277;
    
    guitar=[ghighE,gB,gG,gD,gA,glowE];
    
    if x==1,
        
        p=input ('Which string are you adjusting? 1=e 2=B 3=G 4=D 5=A 6=E');
        
        w=guitar (p);
        
        y=isempty (input ('Press enter to record input signal or 0 to start over. '));
        
        % record input signal
        
        Fs=44100;
        
        T=0:1:Fs/2-1;
        
        RecordObject=audiorecorder(Fs,16,1);
        record(RecordObject,4);
        pause(5);
        %record(RecordObject,'off');
        
        I=getaudiodata(RecordObject,'double');
        

        % let's hear the input signal
        
        display ('This is how the input signal sounds. ');
        
        sound(I,Fs);
        pause(14);
        % to compare frequencies of a stored save file
        % lets hear the output/original signal
        if p==1,
            
            display('This is how the original/output signal sounds');
            [z, f] = audioread('ehstring.mp3');
            player = audioplayer(z, f);
            playblocking(player);
        elseif p==2,
                
            display('This is how the original/output signal sounds');
            [z, f] = audioread('bstring.mp3');
            player = audioplayer(z, f);
            playblocking(player);
        elseif p==3,
            display('This is how the original/output signal sounds');
            [z, f] = audioread('gstring.mp3');
            player = audioplayer(z, f);
            playblocking(player);
        elseif p==4,
            display('This is how the original/output signal sounds');
            [z, f] = audioread('dstring.mp3');
            player = audioplayer(z, f);
            playblocking(player);
        elseif p==5,
            display('This is how the original/output signal sounds');
            [z, f] = audioread('astring.mp3');
            player = audioplayer(z, f);
            playblocking(player);
        else p==6,
            display('This is how the original/output signal sounds');
            [z, f] = audioread('elstring.mp3');
            player = audioplayer(z, f);
            playblocking(player);
        end
        
        % fft of input signal
        
        
       
        J=fft (I)/size(I,1);
        
        K=0:1:Fs/2-1;
        
        while y==1,
            if p==6
                
                for i=400:size(J,1)
                    
                    J(i,1)=0;
                    
                end
                
            else
                
                for i=1500:size(J,1)
                    
                    J(i,1)=0;
                    
                end
                
            end
            
            %Plotting
            
            subplot(2,1,1);
            plot(I,'b');
            xlabel('TIME(S)'),ylabel('AMPLITUDE')
            
            title('INPUT SIGNAL')
            
            
            
          
            subplot(2,1,2);
            plot(K,2*real(J(1:Fs/2)),'r');
            xlabel('TIME(S)'),ylabel('AMPLITUDE')
            
            title('OUTPUT(ORIGINAL) SIGNAL')
            
            
            if p==6
                
                axis([ 200 500 -0.01 0.01])
                
                for i=400:size(J,1)
                    
                    J(i,1)=0;
                    
                end
                
            elseif p==5
                
                axis([ 400 550 -0.01 0.01])
                
                for i=550:size(J,1)
                    
                    J(i,1)=0;
                    
                end
                
            elseif p==4
                
                axis([ 450 700 -0.01 0.01])
                
                for i=700:size(J,1)
                    
                    J(i,1)=0;
                    
                end
            elseif p==3
                
                axis([ 650 850 -0.01 0.01])
                
                for i=900:size(J,1)
                    
                    J(i,1)=0;
                    
                end
                
            elseif p==2
                
                axis([ 800 1100 -0.01 0.01])
                
                for i=1200:size(J,1)
                    
                    J(i,1)=0;
                    
                end
                
            elseif p==1
                
                axis([ 1200 1400 -0.01 0.01])
                
                for i=1500:size(J,1)
                    
                    J(i,1)=0;
                    
                end
                
            end
            
             %xlabel('Frequency(Hz)'),ylabel('Amplitude(V)');
            
            %title('input signal');
            K=0:1:(Fs/2-1);
            
            (1.0015*w);
            
            K (J==max (J));
            
            (0.9985*w)
            
            z=((K (find (J==max (J)))-w)/w)*100;
            
            if (1.0015*w)>K (find (J==max (J)))&& (0.9985*w) <K (find (J==max (J))),
                
                display ('Perfect Intonation!!!');
                
                disp (['The frequency of the input signal is, ',
                    num2str (K (find (J==max (J)))) 'Hz.']);
                
                fprintf ('Percent Error % d %% \n',z)
                
            elseif w>K (find (J==max (J))),
                
                display ('Input frequency should be increased');
                
                disp (['The frequency of the input signal is, ',num2str(K (find (J==max (J)))) 'Hz.']);
                
                fprintf ('Percent Error % d %% \n',z)
                
            elseif w<K (J==max (J)),
                
                display ('Input frequency should be decreased');
                
                disp (['The frequency of the input signal is, ',num2str (K (J==max (J))) 'Hz.']);
                
                fprintf ('Percent Error % d %% \n',z)
                
            end
            
            y=isempty (input ('Make needed adjustments and press enter to record a new input signal or 0 to start over. '));
            
            if y==1,
                
                continue;
                
            else x=1;
                
            end
            
        end
        
    end
    
end


