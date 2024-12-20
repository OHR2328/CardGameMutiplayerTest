const WebSocket = require("ws");
const { v4: uuidv4 } = require("uuid");

const PORT = 8080;
const wss = new WebSocket.Server({ port: PORT }, () => {
  console.log(`WebSocket server listening on ws://localhost:${PORT}`);
});

// Example Deck: Just a few cards
let deck = ["Card A", "Card B", "Card C", "Card D", "Card E"];
// Each client will get these initial sets (player_cards and opponent_cards)
let player_cards_init = ["Card A", "Card B"];
let opponent_cards_init = ["Card C", "Card D", "Card E"];
var count = 0;
var client = [];

function broadcast(connection, id, drawn_card) {
  print("in broadcast function");
  connection.send(
    JSON.stringify({
      type: "card_drawn",
      player: id,
      card: drawn_card,
    })
  );
}

wss.on("connection", (ws) => {
  ws.id = count;
  console.log("Client connected with id:", ws.id);
  client.push({ id: ws.id, connection: ws });
  count += 1;

  ws.on("message", async (data) => {
    console.log("Received raw data:", data);
    let msg = {};
    try {
      msg = JSON.parse(data.toString());
      console.log("Message type:", msg.type);
    } catch (e) {
      console.log("Invalid JSON:", data);
      return;
    }

    if (msg.type === "request_initial_state") {
      var packetofmessage =
        ws.id == 0
          ? JSON.stringify({
              type: "initial_state",
              player_cards: player_cards_init,
              opponent_cards: opponent_cards_init,
            })
          : JSON.stringify({
              type: "initial_state",
              player_cards: opponent_cards_init,
              opponent_cards: player_cards_init,
            });

      ws.send(packetofmessage);
    } else if (msg.type === "draw_card") {
      // Simulate drawing from the deck
      if (deck.length > 0) {
        let drawn_card = deck.pop();
        var client_requesting = ws.id;
        console.log("in drawn card ", ws.id);
        // Loop through all clients and send them the drawn card
        for (var i = 0; i < client.length; i++) {
          let id = client[i].id;
          console.log("in loop sending card to client:", client[i].id);
          client[i].connection.send(
            JSON.stringify({
              type: "card_drawn",
              client_request: client_requesting,
              player: id,
              card: drawn_card,
            })
          );
        }
      } else {
        // No cards left
        ws.send(JSON.stringify({ type: "no_cards_left" }));
      }
    }
  });

  ws.on("close", () => {
    console.log("Client disconnected");
  });
});
