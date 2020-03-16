stlpath = '/d/workspace/matlab/jetfight_stl/';
stlfilename = 'jetfighter.stl';
[v,f,n] = stlRead([stlpath,stlfilename]);
%%
fig = figure;ax = axes();hold(ax,'on');grid(ax,'on');
ax.XLim = [-2 2];ax.YLim = [-2 2]; ax.ZLim = [-2 2];
h = stlPlot(v,f);
h.EdgeColor = 'k';
h.EdgeAlpha = 0.2;
%%
airframe = hgtransform('Parent',ax);
set(h,'Parent',airframe);
Sxyz = makehgtform('Scale',0.0018);
Rz = makehgtform('zrotate',pi/2);
Tz = makehgtform('translate',[0,0,0]);
Tz = makehgtform('translate',[0,150,-75]);
set(airframe,'Matrix',Sxyz*Rz*Tz);
body.x = quiver3(airframe,0,0,0,1.5,0,0,'color','k','linewidth',2,'linestyle','-');
body.y = quiver3(airframe,0,0,0,0,-1.5,0,'color','k','linewidth',2,'linestyle','--');
body.z = quiver3(airframe,0,0,0,0,0,-1.5,'color','k','linewidth',2,'linestyle','-.');
%% Body Frame Grouping
body_frame = hgtransform('Parent',ax);
set(airframe,'Parent',body_frame);
set(body.x,'Parent',body_frame);
set(body.y,'Parent',body_frame);
set(body.z,'Parent',body_frame);
%% Body Frame rotation test
% Rx = makehgtform('xrotate',-pi/2);
% set(body_frame,'Matrix',Rx);
% To rotate about x and y, the angle is negative of the command
for i = -pi/4:0.001:pi/4
    Rx = makehgtform('zrotate',-i);
    set(body_frame,'Matrix',Rx);
    pause(0.001)
end