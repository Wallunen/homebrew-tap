class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "95d1e780ab8ec418e1b64f706198a8b9bf08decba7809d816b053d66fcec84b9" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "07f6ae9ecfa24f21afd8c20cdb90ec0739b089c832d3a4c0deb63397575f8af5" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "cd59bf7c924ca492615439cb5cc570a78803d70b0bf79561367f806617eafd6f" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.739+a69d403cb.tar.xz"
  version "0.14.0-dev.739+a69d403cb"
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
