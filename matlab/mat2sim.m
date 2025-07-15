%% matlab调用omnet++运行
%matlab调用脚本运行

%%脚本运行之后，要等待到脚本运行结束

%% 收到omnet数据后处理

%% matlab设置simulink中时延参数
% 获取模型句柄
model = 'networked'; % 在引号中替换为您的模型名称
load_system(model);
blockPath = find_system(model,'Type','Block');
% 获取模块Transport Delay句柄
block = [model '/Transport Delay']; 
blockHandle = get_param(block, 'Handle');
% 设置时延参数
set_param(blockHandle, 'DelayTime', '0.0020');
% 获取模块Transport Delay句柄
block1 = [model '/Transport Delay1']; 
blockHandle1 = get_param(block1, 'Handle');
% 设置时延参数
set_param(blockHandle1, 'DelayTime', '0.0071');
% 保存更改
save_system(model);
%% matlab调用simulink仿真
sim('networked.slx');

%% 结果输出分析
% %分析超调量
% %在y(∞)不等于给定值时：超调量=[Y(Tm)-Y(∞)]/Y(∞)×100%，（A—最大偏差；B—超调量）
% peak_value=max(y);
%  %= max(output);
% steady_state = 1;
% overshoot = (peak_value(2) - steady_state) / steady_state * 100;
% %峰值时间
% %使用max函数来找到信号的所有峰值。该函数会返回峰值的幅值和对应的索引值。
% [max_value, row_index] = max(y(:,2));
% tm = y(row_index,1);%tm为峰值时间
% %上升时间

%% 通过调用GetPerformanceOfStepResponse(t, y, ys)实现结果分析
yp=y1.';
t=yp(1,:);
yout=yp(2,:);
ys=1;
[OverShoot, RiseTime, PeakTime, AdjustTime, SteadyStateError] = GetPerformanceOfStepResponse(t, yout, ys);
disp(RiseTime);
