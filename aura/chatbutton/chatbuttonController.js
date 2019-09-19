({
    
    liveChatInit: function(componenet, event, helper) {
        if (!window._laq) {
            window._laq = [];
        }
        window._laq.push(function(){
            window.liveagent.showWhenOnline('57328000000L5x8', document.getElementById('liveagent_button_online_57328000000L5x8'));
            window.liveagent.showWhenOffline('57328000000L5x8', document.getElementById('liveagent_button_offline_57328000000L5x8'));
        });

        if ('undefined' !== typeof _satellite) {
            _satellite.pageBottom();
        }
    },
    startLiveChat: function(component, event, helper)
    {
        window.liveagent.startChat('57328000000L5x8');
    }
})