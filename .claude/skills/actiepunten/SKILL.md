---
name: actiepunten
description: Verzamelt verspreide to-do's en actiepunten uit alle bestanden in de map tot één overzichtelijke actiepunten.md (tabel met actie, eigenaar, deadline en bron). Gebruik wanneer de gebruiker /actiepunten aanroept, of vraagt om losse taken, afspraken of to-do's uit notulen, mails of aantekeningen te bundelen tot één actielijst.
---

# Actiepunten verzamelen

Veeg de hele map af en bundel alle verspreide to-do's tot één heldere actielijst. Bedoeld voor
niet-technische gebruikers: de uitkomst moet in één oogopslag te lezen zijn.

## Werkwijze

1. **Lees alle tekstbestanden in de map** (`.md`, `.txt` en vergelijkbaar). Actiepunten zitten
   vaak verstopt in lopende tekst: notulen, een doorgestuurd mailfragment, losse aantekeningen.
2. **Herken actiepunten** — dingen die iemand nog moet *doen*. Signalen o.a.:
   - taken en afspraken: "X pakt … op", "we moeten nog …", "… moet nog gebeuren", "vergeet niet …";
   - open vragen die een actie impliceren: "wie verstuurt de uitnodiging?", "wie doet de opening?".
3. **Leid per actiepunt af:**
   - **Eigenaar** — de genoemde persoon of functie/rol; staat er niemand, zet dan `nog toewijzen`.
   - **Deadline** — alleen als de tekst er één noemt (bv. "twee weken van tevoren", "deze week");
     anders `—`. Verzin geen datums.
   - **Bron** — het bestand waar je het vond.
4. **Ontdubbel.** Hetzelfde actiepunt in meerdere bestanden = één regel; noem dan beide bronnen.
5. **Blijf bij acties.** Verzamel alléén dingen om te dóén. Laat tegenstrijdigheden of mogelijke
   fouten in tijden, data of getallen **met rust** — dat is geen actiepunt en hier niet jouw taak.
6. **Schrijf `actiepunten.md`** met onderstaande tabel; formuleer elke actie kort, met een
   werkwoord vooraan:

   | Actie | Eigenaar | Deadline | Bron |
   |---|---|---|---|
   | Zaal definitief reserveren | … | … | … |

7. **Sluit af** met één regel onder de tabel, bv.: *"12 actiepunten gevonden, waarvan 3 nog toe
   te wijzen."*

## Voorbeeld (ander scenario, alleen ter illustratie van de vorm)

> Bron-notitie: "De conciërge regelt de bus voor de excursie, moet voor vrijdag rond zijn. Nog
> onduidelijk wie de entreekaarten koopt."

Levert op:

| Actie | Eigenaar | Deadline | Bron |
|---|---|---|---|
| Bus voor de excursie regelen | conciërge | voor vrijdag | excursie-notitie.md |
| Entreekaarten kopen | nog toewijzen | — | excursie-notitie.md |
