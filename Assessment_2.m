function Assessment_2 

%%
    clf
    clc

    hold on

    surf([-3,-3;3,3],[-3,3;-3,3],[0.01,0.01;0.01,0.01], ...
        'CData',imread('MineFloor.jpg'),'FaceColor','texturemap');

    wall_1 = imread('Mineflipped.jpg');

    surf([-2.99,-2.99;2.99,2.99],[-2.99,-2.99;-2.99,-2.99],[4,0;4,0] ...
        ,'CData',wall_1,'FaceColor','texturemap');
    camlight
    hold on;

    wall_2 = imread('Mine.jpg');

    surf([-2.99,-2.99;-2.99,-2.99],[2.99,2.99;-2.99,-2.99],[4,0;4,0] ...
        ,'CData',wall_2,'FaceColor','texturemap');
    camlight
    hold on;

    f_1 = PlaceObject('meerkat.ply',[1.5,2,0.18]);
    f_2 = PlaceObject('rockpiles.ply',[1.5,2,0]);
    f_3 = PlaceObject('Buggy.ply',[0,2,0]);


    % f_4 = PlaceObject('barrier1.5x0.2x1m.ply',[1.4,1,0]);
    % verts = [get(f_4,'Vertices'), ones(size(get(f_4,'Vertices'),1),1)] * trotz(pi/2);
    % verts(:,1) = verts(:,1) * 2;
    % set(f_4,'Vertices',verts(:,1:3))

    f_5 = PlaceObject('barrier1.5x0.2x1m.ply',[-0.1,1,0]);
    verts = [get(f_5,'Vertices'), ones(size(get(f_5,'Vertices'),1),1)] * trotz(pi/2);
    verts(:,1) = verts(:,1) * 2;
    set(f_5,'Vertices',verts(:,1:3)) 

    f_6 = PlaceObject('barrier1.5x0.2x1m.ply',[0,1,0]);
    verts = [get(f_6,'Vertices'), ones(size(get(f_6,'Vertices'),1),1)];
    verts(:,1) = verts(:,1) * 2.5;
    set(f_6,'Vertices',verts(:,1:3))

    f_7 = PlaceObject('barrier1.5x0.2x1m.ply',[0,-1,0]);
    verts = [get(f_7,'Vertices'), ones(size(get(f_7,'Vertices'),1),1)];
    verts(:,1) = verts(:,1) * 2.5;
    set(f_7,'Vertices',verts(:,1:3))

    % f_8 = PlaceObject('barrier1.5x0.2x1m.ply',[1.4,-1,0]);
    % verts = [get(f_8,'Vertices'), ones(size(get(f_8,'Vertices'),1),1)] * trotz(pi/2);
    % verts(:,1) = verts(:,1) * 2;
    % set(f_8,'Vertices',verts(:,1:3))

    f_9 = PlaceObject('barrier1.5x0.2x1m.ply',[-0.1,-1,0]);
    verts = [get(f_9,'Vertices'), ones(size(get(f_9,'Vertices'),1),1)] * trotz(pi/2);
    verts(:,1) = verts(:,1) * 2;
    set(f_9,'Vertices',verts(:,1:3))
  
    hold on

    h_1 = PlaceObject('personMaleConstruction.ply',[-2.8,-1,0]);

    h_2 = PlaceObject('emergencyStopButton.ply',[-2.5,-2,0]);

    h_3 = PlaceObject('fireExtinguisher.ply',[-2,2,0]);

    hold on

    r = LinearDobotMagician;
    a = VP5243;

    hold on
    axis([-3,3,-3,3,0,4]);


%% Rock Positions

    hold on
    %-------------------------------------------------------------------------%
    s_1 = PlaceObject('Singlerock.ply',[-0.4, 0.3, 0]);
    verts1 = [get(s_1,'Vertices'), ones(size(get(s_1,'Vertices'),1),1)];
    %-------------------------------------------------------------------------%
    s_2 = PlaceObject('Singlerock.ply',[-0.6, 0.3, 0]);
    verts2 = [get(s_2,'Vertices'), ones(size(get(s_2,'Vertices'),1),1)];
    %-------------------------------------------------------------------------%
    s_3 = PlaceObject('Singlerock.ply',[-0.8, 0.3, 0]);
    verts3 = [get(s_3,'Vertices'), ones(size(get(s_3,'Vertices'),1),1)];
    %-------------------------------------------------------------------------%
    s_4 = PlaceObject('Singlerock.ply',[-0.2, 0.3, 0]);
    verts4 = [get(s_4,'Vertices'), ones(size(get(s_4,'Vertices'),1),1)];
    %-------------------------------------------------------------------------%
    s_5 = PlaceObject('Singlerock.ply',[0, 0.3, 0]);
    verts5 = [get(s_5,'Vertices'), ones(size(get(s_5,'Vertices'),1),1)];
    %-------------------------------------------------------------------------%





    %% Dobot Movements
    
    %-------------------------------------------------------------------------%
    % To flip the x effector so it points downwards
    InverseMatrix = [1, 0, 0, 0;
                 0, -1, 0, 0;
                 0, 0, -1, 0;
                 0, 0, 0, 1];
    
    rotAngle = pi/4;       % the rotation angle
    %-------------------------------------------------------------------------%
    
    
    
    %-------------------------------------------------------------------------%
    %Stone 1
    Stone1Ori = eye(3); % Identity matrix 
        % Rotation for the bricks
    Stone1LastOri = [cos(rotAngle), -sin(rotAngle), 0; sin(rotAngle), cos(rotAngle),0; 0 ,0 ,1];
        % The last position it will be in
    Stone1LastPos = [-0.8,-0.4,0];
    Stone1Pose = [Stone1Ori, [-0.4, 0.3, 0.0366155]'; 0, 0, 0, 1]; 
    Stone1LastPose = [Stone1LastOri, Stone1LastPos'; 0, 0, 0, 1]; 
        % Apply the rotation to the original pose
    Stone1Pose = Stone1Pose * InverseMatrix;
    
    
    %-------------------------------------------------------------------------%
    %Brick 2
    Stone2Ori = eye(3); 
    Stone2LastOri = [cos(rotAngle), -sin(rotAngle), 0; sin(rotAngle), cos(rotAngle),0; 0 ,0 ,1];
    Stone2LastPos = [-0.8,-0.4,0];
    Stone2Pose = [Stone2Ori, [-0.6, 0.3, 0.0366155]'; 0, 0, 0, 1]; 
    Stone2LastPose = [Stone2LastOri, Stone2LastPos'; 0, 0, 0, 1]; 
    Stone2Pose = Stone2Pose * InverseMatrix;
    
    
    %-------------------------------------------------------------------------%
    %Brick 3
    Stone3Ori = eye(3); 
    Stone3LastOri = [cos(rotAngle), -sin(rotAngle), 0; sin(rotAngle), cos(rotAngle),0; 0 ,0 ,1];
    Stone3LastPos = [-0.8,-0.4,0];
    Stone3Pose = [Stone3Ori, [-0.8, 0.3, 0.0366155]'; 0, 0, 0, 1]; 
    Stone3LastPose = [Stone3LastOri, Stone3LastPos'; 0, 0, 0, 1]; 
    Stone3Pose = Stone3Pose * InverseMatrix;
    
    
    %-------------------------------------------------------------------------%
    %Brick 4
    Stone4Ori = eye(3); 
    Stone4LastOri = [cos(rotAngle), -sin(rotAngle), 0; sin(rotAngle), cos(rotAngle),0; 0 ,0 ,1];
    Stone4LastPos = [-0.8,-0.4,0];
    Stone4Pose = [Stone4Ori, [-0.2, 0.3, 0.0366155]'; 0, 0, 0, 1]; 
    Stone4LastPose = [Stone4LastOri, Stone4LastPos'; 0, 0, 0, 1];  
    Stone4Pose = Stone4Pose * InverseMatrix;
    
    
    %-------------------------------------------------------------------------%
    %Brick 5
    Stone5Ori = eye(3); 
    Stone5LastOri = [cos(rotAngle), -sin(rotAngle), 0; sin(rotAngle), cos(rotAngle),0; 0 ,0 ,1];
    Stone5LastPos = [-0.8,-0.4,0];
    Stone5Pose = [Stone5Ori, [0, 0.3, 0.0366155]'; 0, 0, 0, 1]; 
    Stone5LastPose = [Stone5LastOri, Stone5LastPos'; 0, 0, 0, 1]; 
    Stone5Pose = Stone5Pose * InverseMatrix;
    
    
    %-------------------------------------------------------------------------%
    
    
    steps = 100;




    %1
    
            
    T3 = transl(0.5,0.1,0) * troty(pi); %translation matrix
    g3 = a.model.ikcon(T3,[0 0 0 0]);

    endpos = [0 0 0 0]; %end-effector joint agles







    %-------------------------------------------------------------------------%
    %Initial position
    q0 = [0, 0, 0, 0, 0, 0];
    startpos = [0 0 0 0];

    
    %Stone 1 initial Dobot
    % Move the robot arm from q0 to q1
    q1 = r.model.ikcon(Stone1Pose);
    qM = jtraj(q0, q1, steps);
    disp('q1:');
    disp(q1);
    % Animate the robot arm from q0 to q1
    for i = 1:steps
        r.model.animate(qM(i,:));
        %gripper.model.animate(qtraj1(i,:));
        drawnow();
        pause(0);
        % Update the end effector pose
        rpos = r.model.getpos();
        endEffectorPose = r.model.fkine(rpos).T;
    end
    pause(0.1)

    %-------------------------------------------------------------------------%
    %Stone 1 final Dobot
    StoneTransform = endEffectorPose * inv(Stone1Pose);  
    % Set the brick to base on the end effector pose
    newVerts1 = (verts1(:,1:3) * StoneTransform(1:3,1:3)') + StoneTransform(1:3,4)';
    set(s_1, 'Vertices', newVerts1);
    % Move the robot arm from q1 to q2
    q2 = r.model.ikcon(Stone1LastPose);
    qM = jtraj(q1, q2, steps);
    disp('q2:');
    disp(q2);
    % Animate the robot arm from q1 to q2
    for i = 1:steps
        r.model.animate(qM(i,:));
        rpos = r.model.getpos();
        endEffectorPose = r.model.fkine(rpos).T;
        % Calculate the transformation matrix that maps the initial brick position to the end effector position
        % Calculates the transformation
        StoneTransform = endEffectorPose * inv(Stone1Pose);  
        newVerts1 = (verts1(:,1:3) * StoneTransform(1:3,1:3)') + StoneTransform(1:3,4)';
        set(s_1, 'Vertices', newVerts1);
        drawnow();
        pause(0);
    end
    pause(2)

        
    %-------------------------------------------------------------------------%
    %Stone 2 inital
    q3 = r.model.ikcon(Stone2Pose);
    qtraj3 = jtraj(q2, q3, steps);
    disp('q3:');
    disp(q3);
    for i = 1:size(qtraj3, 1)
        r.model.animate(qtraj3(i,:));
        rpos = r.model.getpos();
        endEffectorPose = r.model.fkine(rpos).T;
        drawnow();
        pause(0);
    end
    pause(0.1)

    %---------------------------------------------------------------------%
   
    %Stone 1 VP5243
    T1 = transl(-1,-0.5,0.4); %translation matrix
    g1 = a.model.ikcon(T1,[0 0 0 0]);
    disp('g1:');
    disp(g1);

    gM1 = jtraj(startpos,g1,steps);
            for i = 1:steps
                a.model.animate(qM(i, :));
                drawnow();
                pause(0.1);
            end

    %---------------------------------------------------------------------%


    T2 = transl(-1.2,-0.5,0.2); %translation matrix
    g2 = a.model.ikcon(T2,[0 0 0 0]);
    disp('g2:');
    disp(g2);
    gM = jtraj(g1,g2,steps);
        for i = 1:steps
            a.model.animate(gM(i, :));
            drawnow();
            pause(0.1);
        end
    delete(s_1)
    d_1 = PlaceObject('diamond.ply',[-1.2,-0.5,0]);


    %-------------------------------------------------------------------------%
    %Stone 2 final Dobot
    StoneTransform = endEffectorPose * inv(Stone2Pose);  
    newVerts2 = (verts2(:,1:3) * StoneTransform(1:3,1:3)') + StoneTransform(1:3,4)';
    set(s_2, 'Vertices', newVerts2);
    q4 = r.model.ikcon(Stone2LastPose);
    qtraj4 = jtraj(q3, q4, steps);
    disp('q4:');
    disp(q4);
    for i = 1:size(qtraj4, 1)
        r.model.animate(qtraj4(i,:));
        rpos = r.model.getpos();
        endEffectorPose = r.model.fkine(rpos).T;
        StoneTransform = endEffectorPose * inv(Stone2Pose);  
        newVerts2 = (verts2(:,1:3) * StoneTransform(1:3,1:3)') + StoneTransform(1:3,4)';
        set(s_2, 'Vertices', newVerts2);
        drawnow();
        pause(0);
    end
    pause(2)
    
    %-------------------------------------------------------------------------%
    %Stone 3 initial Dobot
    q5 = r.model.ikcon(Stone3Pose);
    qtraj5 = jtraj(q4, q5, steps);
    disp('q5:');
    disp(q5);
    for i = 1:size(qtraj5, 1)
        r.model.animate(qtraj5(i,:));
        rpos = r.model.getpos();
        endEffectorPose = r.model.fkine(rpos).T;
        drawnow();
        pause(0);
    end
    pause(0.1)

    %---------------------------------------------------------------------%
   
    %Stone 2 VP5243
    T1 = transl(-1,-0.5,0.4); %translation matrix
    g1 = a.model.ikcon(T1,[0 0 0 0]);
    disp('g1:');
    disp(g1);
    gM1 = jtraj(startpos,g1,steps);
            for i = 1:steps
                a.model.animate(qM(i, :));
                drawnow();
                pause(0.1);
            end

    %---------------------------------------------------------------------%


    T2 = transl(-1.2,-0.5,0.2); %translation matrix
    g2 = a.model.ikcon(T2,[0 0 0 0]);
    disp('g2:');
    disp(g2);
    gM = jtraj(g1,g2,steps);
        for i = 1:steps
            a.model.animate(gM(i, :));
            drawnow();
            pause(0.1);
        end
    delete(s_2)
    d_2 = PlaceObject('diamond.ply',[-1,-0.5,0]);

    %-------------------------------------------------------------------------%
    
    %Stone 3 final Dobot
    StoneTransform = endEffectorPose * inv(Stone3Pose); 
    newVerts3 = (verts3(:,1:3) * StoneTransform(1:3,1:3)') + StoneTransform(1:3,4)';
    set(s_3, 'Vertices', newVerts3);
    q6 = r.model.ikcon(Stone3LastPose);
    qtraj6 = jtraj(q5, q6, steps);
    disp('q6:');
    disp(q6);
    for i = 1:size(qtraj6, 1)
        r.model.animate(qtraj6(i,:));
        rpos = r.model.getpos();
        endEffectorPose = r.model.fkine(rpos).T;
        StoneTransform = endEffectorPose * inv(Stone3Pose);  
        newVerts3 = (verts3(:,1:3) * StoneTransform(1:3,1:3)') + StoneTransform(1:3,4)';
        set(s_3, 'Vertices', newVerts3);
        drawnow();
        pause(0);
    end
    pause(2)
    
    %-------------------------------------------------------------------------%
    %Stone 4 inital Dobot
    q7 = r.model.ikcon(Stone4Pose);
    qtraj7 = jtraj(q6, q7, steps);
    disp('q7:');
    disp(q7);
    for i = 1:size(qtraj7, 1)
        r.model.animate(qtraj7(i,:));
        drawnow();
        pause(0);
        rpos = r.model.getpos();
        endEffectorPose = r.model.fkine(rpos).T;
    end
    pause(1.5)

    %---------------------------------------------------------------------%
   
    %Stone 3 VP5243
    T1 = transl(-1,-0.5,0.4); %translation matrix
    g1 = a.model.ikcon(T1,[0 0 0 0]);
    disp('g1:');
    disp(g1);
    gM1 = jtraj(startpos,g1,steps);
            for i = 1:steps
                a.model.animate(qM(i, :));
                drawnow();
                pause(0.1);
            end

    %---------------------------------------------------------------------%


    T2 = transl(-1.2,-0.5,0.2); %translation matrix
    g2 = a.model.ikcon(T2,[0 0 0 0]);
    disp('g2:');
    disp(g2);
    gM = jtraj(g1,g2,steps);
        for i = 1:steps
            a.model.animate(gM(i, :));
            drawnow();
            pause(0.1);
        end
    delete(s_3)
    d_3 = PlaceObject('diamond.ply',[-0.8,-0.5,0]);
    
    %-------------------------------------------------------------------------%
    %Stone 4 final Dobot
    StoneTransform = endEffectorPose * inv(Stone4Pose); 
    newVerts4 = (verts4(:,1:3) * StoneTransform(1:3,1:3)') + StoneTransform(1:3,4)';
    set(s_4, 'Vertices', newVerts4);
    q8 = r.model.ikcon(Stone4LastPose);
    qtraj8 = jtraj(q7, q8, steps);
    disp('q8:');
    disp(q8);
    for i = 1:size(qtraj8, 1)
        r.model.animate(qtraj8(i,:));
        rpos = r.model.getpos();
        endEffectorPose = r.model.fkine(rpos).T;
        StoneTransform = endEffectorPose * inv(Stone4Pose); 
        newVerts4 = (verts4(:,1:3) * StoneTransform(1:3,1:3)') + StoneTransform(1:3,4)';
        set(s_4, 'Vertices', newVerts4);
        drawnow();
        pause(0);
    end
    pause(2)
    
    %-------------------------------------------------------------------------%
    %Stone 5 inital Dobot
    %Q9b5 (starting area)
    q9 = r.model.ikcon(Stone5Pose);
    qtraj9 = jtraj(q8, q9, steps);
    disp('q9:');
    disp(q9);
    for i = 1:size(qtraj9, 1)
        r.model.animate(qtraj9(i,:));
        drawnow();
        pause(0);
        rpos = r.model.getpos();
        endEffectorPose = r.model.fkine(rpos).T;
    end
    pause(1.5)

    %---------------------------------------------------------------------%
   
    %Stone 4 VP5243
    T1 = transl(-1,-0.5,0.4); %translation matrix
    g1 = a.model.ikcon(T1,[0 0 0 0]);
    disp('g1:');
    disp(g1);
    gM1 = jtraj(startpos,g1,steps);
            for i = 1:steps
                a.model.animate(qM(i, :));
                drawnow();
                pause(0.1);
            end

    %---------------------------------------------------------------------%


    T2 = transl(-1.2,-0.5,0.2); %translation matrix
    g2 = a.model.ikcon(T2,[0 0 0 0]);
    disp('g2:');
    disp(g2);
    gM = jtraj(g1,g2,steps);
        for i = 1:steps
            a.model.animate(gM(i, :));
            drawnow();
            pause(0.1);
        end
    delete(s_4)
    d_4 = PlaceObject('diamond.ply',[-0.8,-0.4,0]);

    %-------------------------------------------------------------------------%
    %Stone 5 final
    StoneTransform = endEffectorPose * inv(Stone5Pose);  
    newVerts5 = (verts5(:,1:3) * StoneTransform(1:3,1:3)') + StoneTransform(1:3,4)';
    set(s_5, 'Vertices', newVerts5);
    q10 = r.model.ikcon(Stone5LastPose);
    qtraj10 = jtraj(q9, q10, steps);
    disp('q10:');
    disp(q10);
    for i = 1:size(qtraj10, 1)
        r.model.animate(qtraj10(i,:));
        rpos = r.model.getpos();
        endEffectorPose = r.model.fkine(rpos).T;
        StoneTransform = endEffectorPose * inv(Stone5Pose);  
        newVerts5 = (verts5(:,1:3) * StoneTransform(1:3,1:3)') + StoneTransform(1:3,4)';
        set(s_5, 'Vertices', newVerts5);
        drawnow();
        pause(0);
    end
    pause(2)

%-------------------------------------------------------------------------%
    q11 = [0, 0, 0, 0, 0, 0];
    qtraj11 = jtraj(q10, q11, steps);
    disp('q11:');
    disp(q11);
    for i = 1:size(qtraj11, 1)
        r.model.animate(qtraj9(i,:));
        drawnow();
        pause(0);
        rpos = r.model.getpos();
        endEffectorPose = r.model.fkine(rpos).T;
    end
    pause(1.5)

    %---------------------------------------------------------------------%
   
    %Stone 1 initial VP5243
    T1 = transl(-1,-0.5,0.4); %translation matrix
    g1 = a.model.ikcon(T1,[0 0 0 0]);
    disp('g1:');
    disp(g1);
    gM1 = jtraj(startpos,g1,steps);
            for i = 1:steps
                a.model.animate(qM(i, :));
                drawnow();
                pause(0.1);
            end

    %---------------------------------------------------------------------%


    T2 = transl(-1.2,-0.5,0.2); %translation matrix
    g2 = a.model.ikcon(T2,[0 0 0 0]);
    disp('g2:');
    disp(g2);
    gM = jtraj(g1,g2,steps);
        for i = 1:steps
            a.model.animate(gM(i, :));
            drawnow();
            pause(0.1);
        end
    delete(s_5)
    d_5 = PlaceObject('diamond.ply',[-1,-0.4,0]);


end