female(jean).
female(mary).
female(stella).
female(myra).
female(fiona).
female(val).
female(jessie).
female(jazzy).
male(ruck).
male(matt).
male(ward).
male(alex).
male(dave).
male(joe).
male(whit).
male(andy).
male(cam).
male(joel).
male(jake).
male(chris).

parent_of(jean, matt).
parent_of(jean, mary).
parent_of(jean, ward).
parent_of(ruck, matt).
parent_of(ruck, mary).
parent_of(ruck, ward).
parent_of(stella, dave).
parent_of(stella, myra).
parent_of(stella, cam).
parent_of(whit, dave).
parent_of(whit, myra).
parent_of(whit, cam).
parent_of(mary, alex).
parent_of(dave, alex).
parent_of(joe, fiona).
parent_of(joe, val).
parent_of(myra, fiona).
parent_of(myra, val).
parent_of(jessie, kenny).
parent_of(jessie, andy).
parent_of(jessie, jazzy).
parent_of(jessie, joel).
parent_of(cam, andy).
parent_of(cam, jazzy).
parent_of(cam, joel).
parent_of(cam, jake).
parent_of(jake, chris).

% SISTER
sister(One, Another) :-
    One \== Another,
    female(One),
    parent_of(Parent, One),
    parent_of(Parent, Another).

%TESTS
:- use_module(library(debug)).
:- assertion(sister(mary, matt)).
:- assertion(sister(mary, ward)).
:- assertion(sister(myra, dave)).
:- assertion(sister(myra, cam)).
:- assertion(sister(fiona, val)).
:- assertion(sister(val, fiona)).
:- assertion(sister(jazzy, andy)).
:- assertion(sister(jazzy, joel)).
:- assertion(sister(jazzy, jake)).
:- assertion(\+ sister(matt, mary)).
:- assertion(\+ sister(ward, mary)).

:- assertion(\+ sister(myra, joe)).
:- assertion(\+ sister(myra, jessie)).
:- assertion(\+ sister(jessie, dave)).
:- assertion(\+ sister(jessie, joe)).
:- assertion(\+ sister(jessie, myra)).
:- assertion(\+ sister(jessie, cam)).
:- assertion(\+ sister(fiona, andy)).
:- assertion(\+ sister(val, jake)).
:- assertion(\+ sister(val, chris)).
:- assertion(\+ sister(jazzy, chris)).
:- assertion(\+ sister(jake, chris)).
:- assertion(\+ sister(jean, ruck)).
:- assertion(\+ sister(jean, stella)).

% BROTHER
brother(One, Another) :-
    One \== Another,
    male(One),
    parent_of(Parent, One),
    parent_of(Parent, Another).

%TESTS
:- assertion(brother(matt, mary)).
:- assertion(brother(ward, mary)).
:- assertion(brother(matt, ward)).
:- assertion(brother(ward, matt)).
:- assertion(brother(dave, myra)).
:- assertion(brother(dave, cam)).
:- assertion(brother(cam, dave)).
:- assertion(brother(cam, myra)).
:- assertion(brother(andy, jazzy)).
:- assertion(brother(andy, joel)).
:- assertion(brother(andy, jake)).
:- assertion(brother(joel, andy)).
:- assertion(brother(joel, jazzy)).
:- assertion(brother(joel, jake)).
:- assertion(brother(jake, andy)).
:- assertion(brother(jake, jazzy)).
:- assertion(brother(jake, joel)).
:- assertion(\+ brother(mary, matt)).
:- assertion(\+ brother(mary, ward)).
:- assertion(\+ brother(myra, dave)).
:- assertion(\+ brother(myra, cam)).
:- assertion(\+ brother(fiona, val)).
:- assertion(\+ brother(val, fiona)).
:- assertion(\+ brother(jazzy, andy)).
:- assertion(\+ brother(jazzy, joel)).
:- assertion(\+ brother(jazzy, jake)).
:- assertion(\+ brother(myra, joe)).
:- assertion(\+ brother(myra, jessie)).
:- assertion(\+ brother(jessie, dave)).
:- assertion(\+ brother(jessie, joe)).
:- assertion(\+ brother(jessie, myra)).
:- assertion(\+ brother(jessie, cam)).
:- assertion(\+ brother(fiona, andy)).
:- assertion(\+ brother(val, jake)).
:- assertion(\+ brother(val, chris)).
:- assertion(\+ brother(jazzy, chris)).
:- assertion(\+ brother(jake, chris)).
:- assertion(\+ sister(jean, ruck)).
:- assertion(\+ sister(jean, stella)).

% GRANDPARENT
grandparent(Gran, Kid) :-
    parent_of(Gran, Parent),
    parent_of(Parent, Kid).

% TESTS
:- assertion(grandparent(jean, alex)).
:- assertion(grandparent(ruck, alex)).
:- assertion(grandparent(stella, alex)).
:- assertion(grandparent(stella, fiona)).
:- assertion(grandparent(stella, val)).
:- assertion(grandparent(stella, andy)).
:- assertion(grandparent(stella, jazzy)).
:- assertion(grandparent(stella, joel)).
:- assertion(grandparent(stella, jake)).
:- assertion(grandparent(whit, alex)).
:- assertion(grandparent(whit, fiona)).
:- assertion(grandparent(whit, val)).
:- assertion(grandparent(whit, andy)).
:- assertion(grandparent(whit, jazzy)).
:- assertion(grandparent(whit, joel)).
:- assertion(grandparent(whit, jake)).
:- assertion(grandparent(cam, chris)).
:- assertion(\+ grandparent(alex, jean)).
:- assertion(\+ grandparent(alex, whit)).
:- assertion(\+ grandparent(jean, fiona)).
:- assertion(\+ grandparent(ruck, andy)).
:- assertion(\+ grandparent(joe, val)).
:- assertion(\+ grandparent(whit, chris)).

% GRANDKID
grandkid(Kid, Gran) :-
    grandparent(Gran, Kid).

% TESTS
:- assertion(grandkid(alex, jean)).
:- assertion(grandkid(alex, ruck)).
:- assertion(grandkid(alex, stella)).
:- assertion(grandkid(alex, whit)).
:- assertion(grandkid(fiona, stella)).
:- assertion(grandkid(fiona, whit)).
:- assertion(grandkid(val, stella)).
:- assertion(grandkid(val, whit)).
:- assertion(grandkid(andy, stella)).
:- assertion(grandkid(andy, whit)).
:- assertion(grandkid(jake, stella)).
:- assertion(grandkid(jake, whit)).
:- assertion(grandkid(chris, cam)).
:- assertion(\+ grandkid(jean, alex)).
:- assertion(\+ grandkid(whit, alex)).
:- assertion(\+ grandkid(fiona, joe)).
:- assertion(\+ grandkid(chris, whit)).
