function slBusOut = Range(msgIn, slBusOut, varargin)
%#codegen
%   Copyright 2021-2022 The MathWorks, Inc.
    currentlength = length(slBusOut.Header);
    for iter=1:currentlength
        slBusOut.Header(iter) = bus_conv_fcns.ros.msgToBus.std_msgs.Header(msgIn.Header(iter),slBusOut(1).Header(iter),varargin{:});
    end
    slBusOut.Header = bus_conv_fcns.ros.msgToBus.std_msgs.Header(msgIn.Header,slBusOut(1).Header,varargin{:});
    slBusOut.RadiationType = uint8(msgIn.RadiationType);
    slBusOut.FieldOfView = single(msgIn.FieldOfView);
    slBusOut.MinRange = single(msgIn.MinRange);
    slBusOut.MaxRange = single(msgIn.MaxRange);
    slBusOut.Range_ = single(msgIn.Range_);
end
