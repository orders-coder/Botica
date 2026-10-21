export default function handler(req, res) {
  res.setHeader("Content-Type", "text/plain; charset=utf-8");
  res.setHeader("Cache-Control", "no-store");

  if (req.method !== "POST" && req.method !== "GET") {
    res.setHeader("Allow", "GET, POST");
    res.statusCode = 405;
    res.end("Method not allowed\n");
    return;
  }

  res.statusCode = 501;
  res.end(
    "This signup endpoint is a placeholder. Point it at your mailing list before opening.\n",
  );
}
