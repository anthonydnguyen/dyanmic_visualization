stlpath = '/d/workspace/matlab/jetfight_stl/';
stlfilename = 'scaled_fighterjet.stl';
[v,f,n] = stlRead([stlpath,stlfilename]);
%%
axis_dim = [-2 2];
fig = figure;ax = axes();hold(ax,'on');grid(ax,'on');
ax.XLim = axis_dim;ax.YLim = axis_dim; ax.ZLim = axis_dim;
h = stlPlot(v,f);
h.EdgeColor = 'k';
h.EdgeAlpha = 0.2;