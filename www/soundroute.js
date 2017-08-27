module.exports = {
	OutputTypes: {
		Receiver: 'Receiver',
		Speaker: 'Speaker'
	},

	setCurrentOutput: function(type){
		cordova.exec(null, null, 'SoundRoute', 'setCurrentOutput', [type]);
	}
};