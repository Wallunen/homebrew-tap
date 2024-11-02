class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "2c3a019b2083182c396d2521247595072607e407e44f85462f9ebc87b21934fb" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "ab8e70d3bbc7397d797d9b00de94e78e8bf9e2e15300305cbf774f1ca3f7d75c" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "f9db7b0bb5e216ed266afe8fcb42b3ed60e82bbed0d17a6cc9efbfda277aba27" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2097+d30e28754.tar.xz"
  version "0.14.0-dev.2097+d30e28754"
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
