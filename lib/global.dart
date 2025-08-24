library;

const String mainFont = 'MesloLGS NF';

final String sampleRequest = """
POST https://api-nocode.beid.io/build_info
# Header
Accept-Charset: UTF-8
Accept-Encoding: zstd, br, gzip

# Body

# End
  """;

final String samplePre = """
context.request.headers[authen] = "Bearer ...";
  """;

final String samplePost = """
context.env[""] = "";
  """;

final String sampleSpec = """
var response = context.response.body;
  """;

final String sampleDoc = """
# Sample Document
  """;

final String sampleConfig = """
{
  "conn.timeout": 1000
 ,"read.timeout": 1000
 ,"ssl.verification": false
}
  """;