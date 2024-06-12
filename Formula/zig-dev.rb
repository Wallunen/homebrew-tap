class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "5e342b8795ed54cc11a99c7e859e22011ef7767aff8f62a0204b667b42052603" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "5f2a9f173579612b84ed5561524ad3b570d7908f2482d5a3062bcc725682090e" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "ac76d567f149823b4a13bea664260a93c803161ecefdd7584f7d5540b8e64f43" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.23+d9bd34fd0.tar.xz"
  version "0.14.0-dev.23+d9bd34fd0"
  license "MIT"

  livecheck do
    skip "Dynamic `url` and `sha256`"
  end

  depends_on macos: :big_sur # https://github.com/ziglang/zig/issues/13313
  depends_on "z3"
  depends_on "zstd"
  uses_from_macos "ncurses"
  uses_from_macos "zlib"

  conflicts_with "zig", because: "both install a `zig` binary"

  def install
    bin.install "zig"
    lib.install "lib" => "zig"
  end
end
