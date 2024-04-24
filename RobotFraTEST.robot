*** Settings ***
Library    RequestsLibrary

*** Variables ***
${base_url}           https://jsonplaceholder.typicode.com/posts
#${token}              VOTRE_TOKEN
#${donnees_edition}    {"cle1": "valeur1", "cle2": "valeur2"}  # Remplacer par les données pertinentes

*** Test Cases ***
Test Surcharger le flux éditique
    [Documentation]    Surcharger le flux éditique de l'API
    [Tags]             SurchargerFluxEditique
    ${headers}        Create Dictionary    Content-Type=application/json
    ${body}           Create Dictionary    title=titre de l'article eliane    body=contenu de l'article eliane    userid=111
   # ${response}=       Post    ${base_url}/surcharger-flux-editique    headers=${headers}    json=${donnees_edition}
    ${response}=       Post    ${base_url}    headers=${headers}    #json=${donnees_edition}
    Should Be Equal As Strings    ${response.status_code}    201
    Log    Response Body: ${response.text}

Test Verification des donnees surchargees
    [Documentation]    Vérifier si toutes les données nécessaires ont été récupérées avec succès
    [Tags]             VerificationDonnees
    ${headers}        Create Dictionary    Content-Type=application/json
    #${response}=       Get   ${base_url}/donnees-surchargees    headers=${headers}
    ${response}=       Get   ${base_url}    headers=${headers}
    Should Be Equal As Strings    ${response.status_code}    200
   #${donnees}=        Convert To Dictionary    ${response.text}
    #Should Not Be Empty    ${donnees}
  # Log    Données surchargées: ${donnees}
