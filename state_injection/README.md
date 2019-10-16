# state_injection

Mainly demonstrates working around the issue of injecting a screen's state, with the goal being
achieving similar functionality of Android's ViewModel (https://developer.android.com/topic/libraries/architecture/viewmodel).

The example shows:

- a main screenwhose state is persisted across Widget build calls anywhere up the Widget hierarchy.
- a main screenwhose state has a dependency on another state that is a single app instance.
- a sub screen that accesses the same single app instance via a BlocProvider, so it doesn't need to be injected directly.


  
