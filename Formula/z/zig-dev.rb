class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260618-182235"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "87f608ebf9c223322d71cdffcbdf651d89b30597780ee94fd0dcb68cde4b9251"
    sha256 cellar: :any_skip_relocation, sequoia:      "9ff474d93376ea2aa9ca79fe75f9417239b49718c59d82e2282335ae72040819"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "db27bec0abccbe30e393e4b1ab0401439aa86fe6a83f5f735cc87efb32447ba6"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "1329d4bcb26b2db0801a535cc798789f37fc05825c1d942e39b584b0dbb504f2" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "d49201f9389ef57e8725811149795d998490ff2ffa0b379469fcddc0316728cc" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "07696249a07312c29e8ce6cd74049552fcfb7fc6d679730c4b6c3c3f43948455" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.892+54537285c.tar.xz"
  version "0.17.0-dev.892+54537285c"
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
