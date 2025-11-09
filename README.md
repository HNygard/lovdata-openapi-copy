# Versioned copy of Lovdata Open APIs

Source: https://api.lovdata.no/ / https://api.lovdata.no/swagger


## License

Data is licensed under NLOD 2.0 - https://data.norge.no/nlod/en/2.0

> Lovdata har en sentral rolle i forvaltningen av regelverket, blant annet ved å produsere og utgi Norsk Lovtidend etter oppdrag fraJustis- og beredskapsdepartementet. Den offisielle kunngjøringen av lover og forskrifter i Norsk Lovtidend foregår løpende på lovdata.no. Datasettet til Norsk Lovtiden avd. 1 finner du på Data.norge.no . Det kan fritt benyttes til alle formål uten vederlag. Dataene er lisensiert under NLOD 2.0.
> 
> Også konsoliderte (ajourførte) versjoner av gjeldende lover og sentrale forskrifter kan fritt benyttes til alle formål uten vederlag, gjennom API. Dataene er lisensiert under NLOD 2.0.

(Source: https://api.lovdata.no/om-api-tjenesten/ - https://web.archive.org/web/20251109203129/https://api.lovdata.no/om-api-tjenesten/)

## What does it do?

1. Gets https://api.lovdata.no/v1/publicData/list
```
[
  {
    "filename": "gjeldende-lover.tar.bz2",
    "description": "Gjeldende lover, ajourført med endringer",
    "sizeBytes": "5769192",
    "lastModified": "2025-11-08T02:31:59.418Z"
  },
  (...)
]
```

2. Download every tar ball
3. Extract