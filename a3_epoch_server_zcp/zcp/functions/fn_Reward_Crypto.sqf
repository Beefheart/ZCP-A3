private["_ZCP_currentCapper","_ZCP_name","_capturePosition","_reward","_awardToGive","_changedReward","_vars","_cIndex","_current_crypto"];
_ZCP_currentCapper = _this select 0;
_ZCP_name = _this select 1;
_capturePosition = _this select 2;
_reward = _this select 3;

_awardToGive = 0;
if(ZCP_RewardRelativeToPlayersOnline)then{
	_changedReward = (ZCP_KryptoReward / ZCP_ServerMaxPlayers) * (count playableUnits);
	if(_changedReward < ZCP_MinKryptoReward)then{
		_changedReward = ZCP_MinKryptoReward;
	};
	_awardToGive = floor(_changedReward);
}else{	
	_awardToGive = ZCP_KryptoReward;
};
	
_cIndex = EPOCH_customVars find "Crypto";
_vars = _ZCP_currentCapper getVariable["VARS",[] + EPOCH_defaultVars_SEPXVar];
_current_crypto = _vars select _cIndex;
// epoch rules: Max 25000 cash on you.
_current_crypto = ( _current_crypto + _awardToGive )min 25000;

_vars set[_cIndex,_current_crypto];
_ZCP_currentCapper setVariable["VARS",_vars,true];
[["effectCrypto",_current_crypto],owner _ZCP_currentCapper]call EPOCH_sendPublicVariableClient;

PV_ZCP_zupastic = ["ZCP",format["%2 captured %1 and received his %3 Krypto. The base will dismantle in %4 seconds.",_ZCP_name,name _ZCP_currentCapper,_awardToGive,ZCP_BaseCleanupDelay]];
publicVariable "PV_ZCP_zupastic";	
diag_log text format ["[ZCP]: %1 won %2, received %3 Krypto",name _ZCP_currentCapper,_ZCP_name,_awardToGive];