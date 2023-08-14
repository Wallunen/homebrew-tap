class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "2df51f619afbb58085e80fdbb4da1a80d8936de8c0ab09e80cd6b1979d31bb5f" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "cbb24a227fb1f9287e73e8e085aebd538d6cbc1067c034748b28de896f6e62fd" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "49099e354f2b1ee24560b41c50504631dc29d45bc86b03cd8244fb24037597ba" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.12.0-dev.85+a1049d456.tar.xz"
  version "0.12.0-dev.85+a1049d456"
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
