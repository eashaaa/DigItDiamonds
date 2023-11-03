classdef Collision < handle

%#ok<*NOPRT>
    properties
        r = DobotMagician;
    end

    methods
        function self = Collision()
			clf
            set(0,'DefaultFigureWindowStyle','docked')		
            self.Part1();
            % self.Part2();
            
        end
    end

    methods (Static)
%% Part1
% Collision checking between a Dobot Magician and edge of the ABbot end effector
        function Part1()
            clf
            
            %% Call Dobot
            
            r = DobotMagician
            
            % q = 0;                                                             
            % scale = 0.5;
            workspace = [-0.5 1.5 -0.5 1.5 -1 1];                                      
            % r.plot(q,'workspace',workspace,'scale',scale);                 
            hold on;
            
             %% Call ABBbot
           
            a = ABBbot
            
            % q = 0;                                                             
            % scale = 0.5;
            workspace = [-0.5 1.5 -0.5 1.5 -1 1];                                      
            % r.plot(q,'workspace',workspace,'scale',scale);                 
            hold on;

            % %% Create point and a radius (minDist) around it
            CollidePoint = [-1.1,-0.5,0.5]; %end effector position/corner axis
            % where endeffector is moving
            minDist = 0.01; % Set an appropriate minimum distance/raduis for collision checking
            % [X,Y,Z] = sphere(20);
            % X = X * radius + sphereCenter(1);
            % Y = Y * radius + sphereCenter(2);
            % Z = Z * radius + sphereCenter(3);
            % 
            % %% Plot it
            % if makePointCloud
            %     % Plot point cloud
            %     points = [X(:),Y(:),Z(:)];
            %     spherePc_h = plot3(points(:,1),points(:,2),points(:,3),'r.');                
            % end
			% if makeTriangleMesh
            %     % Triangle mesh plot
            %     tri = delaunay(X,Y,Z);
            %     sphereTri_h = trimesh(tri,X,Y,Z);
            % end
                        
            % drawnow();
            % view(3)
            % axis equal
            
            % %% Move Robot
            for q = 0:pi/180:pi/2
                % r.animate(q);
                drawnow();
                pause(0.1);
            % 
            %     %% Change code to choose the behaviour 
            %     % (1) Do this to move through obstacles with a message
            %     Collision.CheckCollision(r,CollidePoint,minDist);
            %     % OR (2) stop the movement when an obstacle is detected
                if Collision.CheckCollision(r, CollidePoint, minDist) == 1
                    disp('UNSAFE: Robot stopped')
                    break
                end
            end
        end


%% CheckCollision
% Checks for collisions with a the edge of endeffector and can be modified to return an
% isCollision result
function isCollision = CheckCollision(r, CollidePoint, minDist)
% function isCollision = CheckCollision(r, CollidePoint, minDist)
            % Get the current joint positions of the robot
            jointPositions = r.model.getpos();
            
            % Use forward kinematics to calculate the end effector's pose
            endEffectorPose = r.model.fkine(jointPositions);
            
            % Extract the position and orientation from the pose
            endEffectorPosition = transl(endEffectorPose);
            endEffectorOrientation = tr2eul(endEffectorPose);
            
            % Calculate the distance between the end effector and the collision point
            endEffectorToCollidePoint = norm(endEffectorPosition - CollidePoint);
            tr = r.model.fkine(r.model.getpos).T;
            endEffectorToa = sqrt(sum((CollidePoint-tr(1:3,4)').^2));
            if endEffectorToa <= minDist
                disp('Oh no a collision!');
                isCollision = 1;
            else  
                disp(['SAFE: End effector to point distance (', num2str(endEffectorToa), 'm) is more than the minimum distance, ' num2str(minDist), 'm']);
                isCollision = 0;
            end
        
        end
    end
end

