classdef LinearDobotMagician < RobotBaseClass
    %% LinearDobotMagician UR5 on a non-standard linear rail created by a student
    
    properties(Access = public)
        plyFileNameStem = 'LinearDobotMagician';
    end
    
    methods
        %% Define robot Function
        % Constructor for the LinearDobotMagician class.
        % It creates a robot model, optionally specifying a transformation matrix.
        function self = LinearDobotMagician(baseTr)
            % Create the robot model
            self.CreateModel();
            
            % Check if a base transformation matrix is provided, and if not, set it to the default.
            if nargin < 1
                baseTr = eye(4);
            end
            
            % Transform the robot's base using provided or default transformation matrices.
            self.model.base = self.model.base.T * baseTr * trotx(pi/2) * troty(pi/2);
            
            % Plot and colorize the robot.
            self.PlotAndColorRobot();
        end
        
        %% Create the robot model
        % This method defines the robot's kinematic model and joint parameters.
        function CreateModel(self)
            % Create a SerialLink object to represent the robot.
            % Define links with DH parameters, joint limits, and offsets.
            link(1) = Link([pi 0 0 pi/2 1]); % PRISMATIC Link
            link(2) = Link('d', 0.103 + 0.0362, 'a', 0, 'alpha', -pi/2, 'offset', 0, 'qlim', [deg2rad(-135), deg2rad(135)]);
            link(3) = Link('d', 0, 'a', 0.135, 'alpha', 0, 'offset', -pi/2, 'qlim', [deg2rad(5), deg2rad(80)]);
            link(4) = Link('d', 0, 'a', 0.147, 'alpha', 0, 'offset', 0, 'qlim', [deg2rad(-5), deg2rad(85)]);
            link(5) = Link('d', 0, 'a', 0.06, 'alpha', pi/2, 'offset', -pi/2, 'qlim', [deg2rad(-180), deg2rad(180)]);
            link(6) = Link('d', -0.05, 'a', 0, 'alpha', 0, 'offset', pi, 'qlim', [deg2rad(-85), deg2rad(85)]);
            
            % Incorporate joint limits and offsets
            link(1).qlim = [-0.8 -0.01];
            link(2).qlim = [-360 360] * pi/180;
            link(3).qlim = [-90 90] * pi/180;
            link(4).qlim = [-170 170] * pi/180;
            link(5).qlim = [-360 360] * pi/180;
            link(6).qlim = [-360 360] * pi/180;
            
            % Set offsets for specific joints
            link(3).offset = -pi/2;
            link(5).offset = -pi/2;
            
            % Create the robot model using the defined links.
            self.model = SerialLink(link, 'name', self.name);
        end
    end
end
