function Assessment_2 

%%
    clf
    clc

    hold on

    surf([-3,-3;3,3],[-3,3;-3,3],[0.01,0.01;0.01,0.01], ...
        'CData',imread('MineFloor.jpg'),'FaceColor','texturemap');

    f_1 = PlaceObject('meerkat.ply',[1.5,2,0.18]);
    f_2 = PlaceObject('rockpiles.ply',[1.5,2,0]);
    f_3 = PlaceObject('fingerscrossed.ply',[0.3,0,0]);

    f_4 = PlaceObject('barrier1.5x0.2x1m.ply',[1.4,1,0]);
    verts = [get(f_4,'Vertices'), ones(size(get(f_4,'Vertices'),1),1)] * trotz(pi/2);
    verts(:,1) = verts(:,1) * 2;
    set(f_4,'Vertices',verts(:,1:3))

    f_5 = PlaceObject('barrier1.5x0.2x1m.ply',[-0.1,1,0]);
    verts = [get(f_5,'Vertices'), ones(size(get(f_5,'Vertices'),1),1)] * trotz(pi/2);
    verts(:,1) = verts(:,1) * 2;
    set(f_5,'Vertices',verts(:,1:3)) 

    f_6 = PlaceObject('barrier1.5x0.2x1m.ply',[0,1,0]);
    verts = [get(f_6,'Vertices'), ones(size(get(f_6,'Vertices'),1),1)];
    verts(:,1) = verts(:,1) * 2;
    set(f_6,'Vertices',verts(:,1:3))

    f_7 = PlaceObject('barrier1.5x0.2x1m.ply',[0,-2.25,0]);
    verts = [get(f_7,'Vertices'), ones(size(get(f_7,'Vertices'),1),1)];
    verts(:,1) = verts(:,1) * 2;
    set(f_7,'Vertices',verts(:,1:3))

    f_8 = PlaceObject('barrier1.5x0.2x1m.ply',[1.4,-1,0]);
    verts = [get(f_8,'Vertices'), ones(size(get(f_8,'Vertices'),1),1)] * trotz(pi/2);
    verts(:,1) = verts(:,1) * 2;
    set(f_8,'Vertices',verts(:,1:3))

    f_9 = PlaceObject('barrier1.5x0.2x1m.ply',[-0.1,-1,0]);
    verts = [get(f_9,'Vertices'), ones(size(get(f_9,'Vertices'),1),1)] * trotz(pi/2);
    verts(:,1) = verts(:,1) * 2;
    set(f_9,'Vertices',verts(:,1:3))
  



    r = DobotMagician;

    hold on
    axis([-3,3,-3,3,0,4]);



%%
q1 = [0,0,0,0,0]; % Derive joint angles for required end-effector transformation
% Rock 1
T1 = transl(0.3,0,0.04) * troty(pi); % Define a translation matrix
p1 = r.model.ikcon(T1,[0 0 0 0 0]); % Use inverse kinematics to get the joint angles

T2 = transl(0.3,-0.4,0.04); % Define a translation matrix
m1 = r.model.ikcon(T2,[0 0 0 0 0]); % Use inverse kinematics to get the joint angles

% Rock 2
T3 = transl(0.3,0,0.04) * troty(pi); % Define a translation matrix
p2 = r.model.ikcon(T3,[0 0 0 0 0]); % Use inverse kinematics to get the joint angles

T4 = transl(0.3,-0.4,0.4); % Define a translation matrix
m2 = r.model.ikcon(T4,[0 0 0 0 0]); % Use inverse kinematics to get the joint angles



steps = 50;


qMatrix = jtraj(q1,p1,steps);

    for i= 1:steps
        r.model.animate(qMatrix(i,:));
        drawnow();
        pause(0.1);
    end

qMatrix = jtraj(p1,m1,steps);

    for i= 1:steps
        r.model.animate(qMatrix(i,:));
        drawnow();
        pause(0.1);
    end

qMatrix = jtraj(m1,p2,steps);

    for i= 1:steps
        r.model.animate(qMatrix(i,:));
        drawnow();
        pause(0.1);
    end

qMatrix = jtraj(p2,m2,steps); 

    for i= 1:steps
        r.model.animate(qMatrix(i,:));
        drawnow();
        pause(0.1);
    end





end