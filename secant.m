function t_secant = secant(t1, dL)

    t0 = 0;                % första gissning [s]
    
    for k = 1:50
        f0 = dL(t0);
        f1 = dL(t1);
    
        % secant-steg
        t2 = t1 - f1*(t1 - t0)/(f1 - f0);
    
        % stoppvillkor
        if abs(t2 - t1) < 1e-6*abs(t2)
            break
        end
    
        t0 = t1;
        t1 = t2;
    end
    
    t_secant  = t1;
end
