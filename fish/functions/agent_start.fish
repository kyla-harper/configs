# Defined in /tmp/fish.mf8jsq/agent_start.fish @ line 1
function agent_start --description 'Starts SSH Agent for Fish'
	eval (ssh-agent -c)
end
