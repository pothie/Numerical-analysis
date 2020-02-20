%4.1-1
%a
s1 = @(theta)(sin(2*theta));
s2 = @(theta)(2*sin(theta).*cos(theta));
val = 10.*rand([1,10]);
s1_val = s1(val);
s2_val = s2(val);
diff_s1s2 = abs(s1_val - s2_val);

%b
s3 = @(theta) (sin(3*theta));
s4 = @(theta) sin(theta).*(4*cos(theta).^2-1);
s3_val = s3(val);
s4_val = s4(val);
diff_s3s4 = abs(s3_val - s4_val);
val_deg = rad2deg(val);
disp("          theta(in degrees)      "+"s1(theta)-s2(theta)      "+"s3(theta)-s4(theta)")
disp([val_deg;diff_s1s2; diff_s3s4]')