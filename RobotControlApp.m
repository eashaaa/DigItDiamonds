classdef RobotControlApp < matlab.apps.AppBase

    %% Properties
    properties (Access = private)
        ABBbotRobot % Instance of the ABBbot robot
        DobotMagicianRobot % Instance of the DobotMagician robot
        TeachModeActive = false
    end

    % App Designer components
    properties (Access = public)
        UIFigure            matlab.ui.Figure
        ABBbotJointSliders  matlab.ui.control.Slider
        DobotMagicianJointSliders  matlab.ui.control.Slider
        ABBbotCartesianEdit matlab.ui.control.EditField
        DobotMagicianCartesianEdit matlab.ui.control.EditField
        TeachModeButton     matlab.ui.control.Button
        % Add other components as needed
    end

    %% App Designer callbacks
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
            % Initialize GUI components and robot control - default values
            % Set initial joint angles or Cartesian positions
            app.ABBbotJointSliders.Value = [0, 0, 0, 0, 0, 0];
            app.DobotMagicianJointSliders.Value = [0, 0, 0, 0, 0, 0];
            app.ABBbotCartesianEdit.Value = [0, 0, 0];
            app.DobotMagicianCartesianEdit.Value = [0, 0, 0];

            % Connect to robots and set up control interfaces

        end

       
        % Callback function for Robot 1 joint sliders
        function ABBbotJointSlidersValueChanged(app, event)
            if app.TeachModeActive
                jointValues = app.ABBbotJointSliders.Value;
                app.ABBbotRobot.MoveToJointAngles(jointValues);
            end
        end

        % Callback function for Robot 2 joint sliders
        function DobotMagicianJointSlidersValueChanged(app, event)
            if app.TeachModeActive
                jointValues = app.DobotMagicianJointSliders.Value;
                app.DobotMagicianRobot.MoveToJointAngles(jointValues);
            end
        end

        % Callback function for Cartesian Filed Value
        function CartesianEditFieldValueChanged(app, event)
            if app.TeachModeActive
                cartesianPosition = app.ABBbotCartesianEdit.Value;
                jointAngles = app.ABBbotRobot.InverseKinematics(cartesianPosition);
                app.ABBbotRobot.MoveToJointAngles(jointAngles);
            end
        end

        % Callback function for Teach Mode
        function TeachModeButtonPushed(app, event)
            app.TeachModeActive = ~app.TeachModeActive;

            if app.TeachModeActive
               app.TeachModeButton.Text = "Exit Teach Mode";
            else
               app.TeachModeButton.Text = "Enter Teach Mode";
            end
        end
    end
    % Create the app
    methods
        function createComponents(app)
            %UI components 
            % Create and configure UI components here
            app.UIFigure = uifigure('Name', 'Robot Control App', 'Position', [100, 100, 800, 600]);
            
            % ABBbot controls
            app.ABBbotJointSliders = uislider(app.UIFigure, 'Position', [50, 400, 300, 3]);
            app.ABBbotJointSliders.Limits = [0, 1];
            app.ABBbotJointSliders.Value = 0.5;
            app.ABBbotJointSliders.MajorTicks = [0 0.2 0.4 0.6 0.8 1];
            app.ABBbotJointSliders.ValueChangedFcn = createCallbackFcn(app, @ABBbotJointSlidersValueChanged, true);
            
            app.ABBbotCartesianEdit = uieditfield(app.UIFigure, 'numeric', 'Position', [50, 350, 100, 22]);
            app.ABBbotCartesianEdit.ValueChangedFcn = createCallbackFcn(app, @app.CartesianEditFieldValueChanged, true);


            app.ABBbotJointLabel = uilabel(app.UIFigure, 'Text', 'ABBbot Joint', 'Position', [50, 220, 100, 22]);
            
            % DobotMagician controls
            app.DobotMagicianJointSliders = uislider(app.UIFigure, 'Position', [450, 400, 300, 3]);
            app.DobotMagicianJointSliders.Limits = [0, 1];
            app.DobotMagicianJointSliders.Value = 0.5;
            app.DobotMagicianJointSliders.MajorTicks = [0, 0.5, 1];
            app.DobotMagicianJointSliders.ValueChangedFcn = @app.DobotMagicianJointSlidersValueChanged;
            app.DobotMagicianJointSliders.Parent = app.UIFigure;  % Specify the parent container
            
            app.DobotMagicianCartesianEdit = uieditfield(app.UIFigure, 'numeric', 'Position', [450, 350, 100, 22]);
            app.DobotMagicianCartesianEdit.ValueChangedFcn = @app.CartesianEditFieldValueChanged;
            app.DobotMagicianCartesianEdit.Parent = app.UIFigure;  % Specify the parent container

            app.DobotMagicianJointLabel = uilabel(app.UIFigure, 'Text', 'Dobot Magician Joint', 'Position', [50, 120, 120, 22]);
            
            % Teach mode button
            app.TeachModeButton = uibutton(app.UIFigure, 'push', 'Text', 'Enter Teach Mode', 'Position', [50, 300, 150, 30]);
            app.TeachModeButton.ButtonPushedFcn = @app.TeachModeButtonPushed;
        end

        % Construct app
        function app = RobotControlApp
            % Create UIFigure and components
            app.UIFigure = uifigure('Name', 'Robot Control App', 'Position', [100, 100, 800, 600]);
            createComponents(app);
        end
    end
end
