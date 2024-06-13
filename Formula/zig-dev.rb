class ZigDev < Formula
  os = "macos"
  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "8537c10d8983c93886d19f1c759c8664695205b6beeebbbe38b891fb1676df09" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "4c95a4d760b855c68610412a93362e654bd17787549645f60afb493b94d24256" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "eaf0cce00327b6d28c7c889bdbd434a5dd153704d4f337cdff16fd4045f81672" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{os}-#{arch}-0.14.0-dev.27+0cef727e5.tar.xz"
  version "0.14.0-dev.27+0cef727e5"
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
