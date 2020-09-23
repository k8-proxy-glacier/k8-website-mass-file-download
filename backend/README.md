# K8-Mass-File-Download


## Usage

### Build

To build the Docker image and name it `k8-mass-file-download` run:

`docker build -t k8-mass-file-download .`

To push
`docker push <username>/k8-mass-file-download`

### Run

To run the aforementioned built image run:

`docker run -e STATIC_PATH=<static_path>  -p 5000:5000 -it --rm k8-mass-file-download`

### Endpoints [ All POST ]

| Endpoint | Description             | Payload     |
| -------- | ------------------------| ----------- |
| `/get-offline` | Clone given url to static path |  `{"url": "https://www.gov.uk/"}` |
