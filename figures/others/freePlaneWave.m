close all;
%量子力学
a=1/4; %波包宽度
x0=0; %初始位置
k0=3; %空间角频率

%效果
width=3; %丝带宽度
Yend=linspace(15,40,4);
Ystart=2*[6 12 18 24]-Xend;
color=[0.729 0.831 0.957 %颜色
          0.392 0.475 0.635
          0.306 0.396 0.580
          0.204 0.302 0.494]; 


%设置相框
setfigure blank; hold on; box on; set(gca,'visible','off');
for t=[2,4,6,8];
    y=linspace(Ystart(t/2),Yend(t/2),1000);
    z=sqrt(2.*a./pi)./sqrt(1+4.*a.^2.*t.^2).*exp(-2.*a.*(y-x0-k0.*t).^2./(1+4.*a.^2.*t.^2));
    z=z*70; %z(1)=-5; z(end)=25;
    x=(t/2-1)*width*ones(size(z));
    x=[x;x+width]; y=[y;y]; z=[z;z];
    h(t/2)=surf(x,y,z,'cdata',zeros(size(z)),'facecolor',color(t/2,:),'edgecolor','none'); 
end
axis equal; axis([0 12,-5,40,0,20]); %设置坐标轴
view([45 30]);
xlabel('x'); ylabel('y'); zlabel('z');
H1=light('position',[-5,0,10],'color',[0.8 0.8 1]);
H2=light('position',[-9.08,-9.41,0.0607],'color',[0.5 0.5 0.5]);
export_fig('普通物理索引图标.png','-r300');