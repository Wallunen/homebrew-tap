class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "af15564bca25afb55e115518086c98dc812a4b4c776eabe89959bc86292ee18d" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "bfddeff7b93384f18862a5bdb23c50509013a9e624cf30c2939b2ba1182663f3" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "ee69a290b776228123c8d4c5ae894d0583016074f03f75d35295b2aa4533cde7" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.2370+5c6b25d9b.tar.xz"
  version "0.14.0-dev.2370+5c6b25d9b"
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
