FROM golang:1.19

# Define the working directory
WORKDIR /app

# Copy the go.mod file into the app directory in the container
COPY go.mod ./

# Download all the dependencies
#RUN go mod download

# Copy the source from the current directory to the working Directory inside the container
COPY *.go ./

# Build the Go app
RUN CGO_ENABLED=0 GOOS=linux go build -o /docker-go

# Run the executable
CMD ["/docker-go"]
