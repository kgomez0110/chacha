scriptId = 'com.thalmic.examples.h'  
    scriptTitle = "Cha Cha Hack"  
    scriptDetailsUrl = ""


   myo.setLockingPolicy("standard");
  -- myo.unlock("off")
    function onForegroundWindowChange(app, title)  
        myo.debug("onForegroundWindowChange: " .. app .. ", " .. title)
        return true
    end
    function onPoseEdge(pose, edge)
        myo.setLockingPolicy("standard");
    	myo.debug("Current Pose: " .. pose .. " Edge: " .. edge)
    	pose = conditionallySwapWave(pose)
    	local keyEdge
    	if(edge == "on") then
    		keyEdge = "down"
    	else
    		keyEdge = "up"
    	end
    	-- if (pose ~= "rest" and pose ~= "unknown") then
            -- hold if edge is on, timed if edge is off
       --     myo.unlock(edge == "off" and "timed" or "hold")
      --  end 
 		 
    	if (edge == "on") then
            if (pose == "waveOut") then
                onWaveOut(keyEdge)   
            elseif (pose == "waveIn") then
                onWaveIn(keyEdge)
            elseif (pose == "fist") then
                onFist(keyEdge)
            elseif (pose == "fingersSpread") then
                onFingersSpread(keyEdge)           
            end
        end
    end

 	function onWaveOut(keyEdge)
 		myo.debug("Next")
 		myo.vibrate(short)  
 		myo.keyboard("0",keyEdge)
        myo.keyboard("return", keyEdge)
 	end
	function onWaveIn(keyEdge)  
        myo.debug("Previous")  
        myo.vibrate(short)
        myo.keyboard("1",keyEdge)
        myo.keyboard("return", keyEdge)
    end

    function onFist(keyEdge)  
    	myo.setLockingPolicy("none");
        myo.debug("left")  
        myo.vibrate(short)
        myo.keyboard("2",keyEdge)
        myo.keyboard("return", keyEdge)
    end

    function onFingersSpread(keyEdge)  
        myo.debug("Escape")
       -- myo.vibrate(long)
        myo.vibrate(short)
        myo.keyboard("3", keyEdge)
        myo.keyboard("return", keyEdge)
    end 
	function conditionallySwapWave(pose)  
        if myo.getArm() == "left" then
            if pose == "waveIn" then
                pose = "waveOut"
            elseif pose == "waveOut" then
                pose = "waveIn"
            end
        end
        return pose
    end



    -- turn off lock myo.setLockingPolicy("none")
    -- turn on  lock myo.setLockingPolicy("standard")
    -- myo.unlock(unlockType)
    -- 	timed - reset clock and keep armband unlocked for a few seconds
    --  hold  - stay unlocked until manually locked
