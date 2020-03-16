if(0)
EARTH_R = 6.371e6; %m
frame_comp = {'x','y','z'};
[x,y,z] = sphere(10);
x = x*EARTH_R;
y = y*EARTH_R;
z = z*EARTH_R;
%%
fig = figure;
ax = axes('XLim',[-EARTH_R,EARTH_R],...
          'YLim',[-EARTH_R,EARTH_R],...
          'ZLim',[-EARTH_R,EARTH_R]);
hold(ax,'on'); grid(ax,'on');
view(3);
axis('equal')
h = surf(x,y,z);
h.FaceAlpha = 0;
%% ECEF frame
ecef.x = quiver3(0,0,0,EARTH_R*1.5,0,0,'color','k');
ecef.y = quiver3(0,0,0,0,EARTH_R*1.5,0,'color','k');
ecef.z = quiver3(0,0,0,0,0,EARTH_R*1.5,'color','k');
%% ECI frame
eci.x = quiver3(0,0,0,EARTH_R*1.5,0,0,'color','g','linestyle','-');
eci.y = quiver3(0,0,0,0,EARTH_R*1.5,0,'color','g','linestyle','--');
eci.z = quiver3(0,0,0,0,0,EARTH_R*1.5,'color','g','linestyle','-.');
%%
for i = 1:3
    ecef.(frame_comp{i}).LineWidth = 2;
end
%% set a new axis(?)
t = hgtransform('Parent',ax);
%%
set(h,'Parent',t);
set(eci.x,'Parent',t);
set(eci.y,'Parent',t);
set(eci.z,'Parent',t);
end
%%
for r = 0:22.5:360
    % Z-axis rotation matrix
    Rz = makehgtform('zrotate',r*pi/180);
    % Scaling matrix
%     Sxy = makehgtform('scale',r/4);
    % Concatenate the transforms and
    % set the transform Matrix property
    set(t,'Matrix',Rz)
    drawnow
end