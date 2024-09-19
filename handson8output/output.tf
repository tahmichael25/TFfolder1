# Below is the Output blocks
output "timestamp" {
  value = timestamp()
}

output "formattedtimestamp" {
  value = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
}