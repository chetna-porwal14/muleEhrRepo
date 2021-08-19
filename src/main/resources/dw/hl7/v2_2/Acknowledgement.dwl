%dw 2.0
output application/json
---
{
  Name: "ACK",
  MSH: payload.ACK.MSH,
  Id: "ACK",
  Data: {
    ACK: payload.ACK
  }
}