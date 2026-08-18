//---------------------------------------------------------------------------------------
//  FILE: X2EventListener_ArchipelagoRandomizer.uc
//
//  Event listeners used by Archipelago Randomizer.
//---------------------------------------------------------------------------------------

class X2EventListener_ArchipelagoRandomizer extends X2EventListener;

static function array<X2DataTemplate> CreateTemplates()
{
    local array<X2DataTemplate> Templates;

    Templates.AddItem(CreateTutorialCompleteListener());

    return Templates;
}

static function X2EventListenerTemplate CreateTutorialCompleteListener()
{
    local X2EventListenerTemplate Template;

    `CREATE_X2TEMPLATE(
        class'X2EventListenerTemplate',
        Template,
        'Archipelago_TutorialComplete'
    );

    Template.RegisterInStrategy = true;
    Template.AddEvent(
        'STRATEGY_TutorialMissionComplete_Submitted',
        OnTutorialMissionComplete
    );

    return Template;
}

static function EventListenerReturn OnTutorialMissionComplete(
    Object EventData,
    Object EventSource,
    XComGameState GameState,
    Name Event,
    Object CallbackData)
{
    `log("Archipelago Randomizer: Tutorial completion event received");

    return ELR_NoInterrupt;
}