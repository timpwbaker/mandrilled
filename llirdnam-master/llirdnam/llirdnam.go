package main

import (
	"bytes"
	"encoding/json"
	"log"
	"math/rand"
	"net/http"
	"os"
	"time"
)

type Event struct {
	Address   string
	EmailType string
	Event     string
	Timestamp int64
}

func randomSender() string {
	senders := []string{
		"alex@lostmy.name",
		"barney@lostmy.name",
		"callum@lostmy.name",
		"f@lostmy.name",
		"jacob@lostmy.name",
		"jesse@lostmy.name",
		"josh@lostmy.name",
		"oz@lostmy.name",
		"patrick@lostmy.name",
		"pete@lostmy.name",
		"rehat@lostmy.name",
		"simon@lostmy.name",
		"simonf@lostmy.name",
		"tal@lostmy.name",
		"tom@lostmy.name",
		"tony@lostmy.name",
		"vitor@lostmy.name",
	}

	return senders[rand.Intn(len(senders))]
}

func randomEvent() string {
	randomInt := rand.Intn(100)
	switch {
	case randomInt < 60:
		return "send"
	case randomInt < 90:
		return "open"
	default:
		return "click"
	}
}

func randomEmailType() string {
	types := []string{
		"Order",
		"UserConfirmation",
		"Shipment",
		"ReferAFriend",
		"GetABookDiscount",
	}

	return types[rand.Intn(len(types))]
}

func sendRequests(target string) {
	for {
		event := Event{
			randomSender(),
			randomEmailType(),
			randomEvent(),
			time.Now().Unix(),
		}
		eventJson, _ := json.Marshal(event)
		resp, err := http.Post(
			target,
			"text/json",
			bytes.NewReader(eventJson),
		)

		if err != nil {
			log.Fatal(err)
		}

		if resp.StatusCode != 200 {
			log.Fatalf("Expecting 200 returned, got %f", resp.StatusCode)
		}

		time.Sleep(1 * time.Second)
	}
}

func main() {
	if len(os.Args) != 2 {
		log.Fatal("Invalid number of arguements. Expecting 1 argument, the target for email events. Use --help for more help.")
	}

	if os.Args[1] == "--help" {
		log.Print("Llirdnam, the fake email event sender. The only argument should be the address you want to send the events to.")
	} else {
		target := os.Args[1]
		log.Printf("Sending events to: %s", target)
		sendRequests(target)
	}
}
