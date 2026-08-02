class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260802-021204"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "5cd514910c88f88aa2c16bf8138a01620ad83db2a57d8837a72f360f9afad683"
    sha256 cellar: :any_skip_relocation, sequoia:      "c632af942ac5ac38cedfd89714d770ac8253c8caf2cd4c79c5109eba6a5efea1"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "2decb4ce8062d0359631eeabf758bfd11bd069f215bc499d57cf016093030d68"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "45bd74d98b5a18bc206316000aa8067117864f41a12465dc4384dfd370b27886" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "7d9b13b680857133a7886dd0d840d4a9d9d51fbb519110728d02cad7a86b29a4" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "799d9e7f8e304adff896075f017036e62163925fef52458da8e09c0da5ddb5a0" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.1525+91c6d8a09.tar.xz"
  version "0.17.0-dev.1525+91c6d8a09"
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
